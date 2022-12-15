class AddDefaultToQuantity < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:order_items, :quantity, 1)
  end
end
