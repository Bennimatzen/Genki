class AddSkuToPrescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :prescriptions, :sku, :string
  end
end
