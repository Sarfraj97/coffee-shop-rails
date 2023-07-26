class RemoveCategoryType < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :category, :integer
    add_column :items, :company, :string
  end
end
