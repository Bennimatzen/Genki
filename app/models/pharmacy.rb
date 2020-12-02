class Pharmacy < ApplicationRecord
  geocoded_by :address
  has_many :orders
  after_validation :geocode, if: :will_save_change_to_address?
end
