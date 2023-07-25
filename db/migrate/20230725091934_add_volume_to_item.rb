class AddVolumeToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :volume, :integer
    add_column :items, :volume_type, :string
  end
end
