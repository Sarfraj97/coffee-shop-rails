class FixedVariant < ActiveRecord::Migration[7.0]
  def change
    remove_reference :variants, :products
    add_reference :variants, :product, null: false, foreign_key: true
  end
end
