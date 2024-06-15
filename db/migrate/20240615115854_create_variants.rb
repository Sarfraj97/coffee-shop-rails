class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.references :products, foreign_key: true
      t.decimal :weight
      t.decimal :length
      t.decimal :height
      t.decimal :cost_price
      t.string :cost_currency
      t.string :sku
      t.timestamps
    end
  end
end
