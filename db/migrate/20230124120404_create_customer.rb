class CreateCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :phone_number
      t.string :state
      t.integer :state_code
      t.string :gst

      t.timestamps
    end
  end
end
