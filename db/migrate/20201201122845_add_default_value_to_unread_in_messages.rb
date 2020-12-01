class AddDefaultValueToUnreadInMessages < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :unread, :boolean, default: true
  end
end
