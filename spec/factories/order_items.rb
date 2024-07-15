FactoryBot.define do
    factory :order_items do
      product { association :product }
      order { association :order }  
      quantity { 3 }  
    end
  end
  