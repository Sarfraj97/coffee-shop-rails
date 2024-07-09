class RemoveAddressFromCustomer < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :gst
    remove_column :customers, :state_code
    remove_column :customers, :state
    remove_column :customers, :city
    remove_column :customers, :address
  end
end
