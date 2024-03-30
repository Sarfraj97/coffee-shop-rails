class RemoveCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :category, :integer
    add_reference :items, :category
  end
end
