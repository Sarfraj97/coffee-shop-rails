# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders  

  def self.random_customer
    find_by_name('random')
  end  
end
