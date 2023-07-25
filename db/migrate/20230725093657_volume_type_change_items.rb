class VolumeTypeChangeItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :volume_type, :string
    add_column :items, :volume_type, :integer
  end
end
