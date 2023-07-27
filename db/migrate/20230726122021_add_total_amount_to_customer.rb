class AddTotalAmountToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :total_amount, :integer
  end
end
