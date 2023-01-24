class AddCustomerIdToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :customer_id, :integer
  end
end
