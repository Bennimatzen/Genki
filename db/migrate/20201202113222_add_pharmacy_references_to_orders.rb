class AddPharmacyReferencesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :pharmacy, index: true
  end
end
