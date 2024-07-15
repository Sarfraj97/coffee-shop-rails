FactoryBot.define do
    factory :order do
      total_price { 1450 }
      status { 1 }
      customer { association :customer }  
    end
  end
  