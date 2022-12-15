# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.integer :status
      t.string :phone_number

      t.timestamps
    end
  end
end
