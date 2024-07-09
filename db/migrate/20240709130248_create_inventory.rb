class CreateInventory < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :product
      t.references :warehouse
      t.integer :quantity
      t.timestamps
    end
  end
end
