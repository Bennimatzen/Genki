class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :nhs_number, presence: true
  validates :gender, inclusion: { in: ["Male", "Female", "Sexy Bot"] }

  has_many :diseases
  has_many :symptoms, through: :diseases
  has_many :symptomchecks
  has_many :doctors, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :appointment_summaries, through: :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :chat_messages, through: :chats
  has_many :orders
  has_one :prescription_checks

  def all_unread_messages
    chats_count = 0
    chats.each do |chat|
      if chat.messages.present?
        chats_count += chat.unread_messages_count
      end
    end
    return chats_count
  end

  def unread_messages?
    all_unread_messages > 0
  end

  def all_unread_summaries
    letters_count = 0
    appointment_summaries.each do |letter|
      if letter.unread?
        letters_count += letter.unread_summaries_count
      end
    end
    return letters_count
  end

  def unread_letters?
    all_unread_summaries > 0
  end

  def all_pill_reminder_notifications
    total_reminders = prescriptions.where(reminder: true).count
    done_reminders = 0
    prescriptions.where(reminder: true).each do |reminder|
      if DateTime.now < (reminder.created_at + reminder.duration.day) && reminder.prescription_check_today?
        done_reminders += 1
      end
    end
    total_notifications = total_reminders - done_reminders
    return total_notifications
  end

  def doctor?
    self.doctors.any?
  end
end
