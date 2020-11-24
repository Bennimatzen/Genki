class Disease < ApplicationRecord
  belongs_to :user
  has_many :symptoms
end
