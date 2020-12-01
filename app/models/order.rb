class Order < ApplicationRecord
  belongs_to :user
  belongs_to :prescription

  monetize :amount_cents
end
