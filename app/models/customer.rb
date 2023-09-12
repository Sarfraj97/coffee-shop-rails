# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders
  has_one :account
  has_many :reminders, as: :remindable

  def self.random_customer
    find_by_name('random')
  end  
end
