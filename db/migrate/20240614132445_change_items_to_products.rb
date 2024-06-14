class ChangeItemsToProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :items, :products
  end
end
