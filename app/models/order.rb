class Order < ApplicationRecord
  belongs_to :user
  belongs_to :prescription
  belongs_to :pharmacy

  monetize :amount_cents
end
