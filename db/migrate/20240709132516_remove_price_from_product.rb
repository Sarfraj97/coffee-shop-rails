class RemovePriceFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :price
    remove_column :products, :volume_type
    remove_column :orders, :phone_number
  end
end
