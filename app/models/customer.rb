# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders
  has_many :transactions
  attribute :total_amount, :integer, default: 0

  def self.random_customer
    find_by_name('random')
  end  
end
