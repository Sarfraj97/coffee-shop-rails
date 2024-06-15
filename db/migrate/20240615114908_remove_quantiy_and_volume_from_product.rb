class RemoveQuantiyAndVolumeFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :quantity
    remove_column :products, :volume
  end
end
