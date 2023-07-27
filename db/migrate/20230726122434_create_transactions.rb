class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :amount_type
      t.integer :amount
      t.references :customer
      t.timestamps
    end
  end
end
