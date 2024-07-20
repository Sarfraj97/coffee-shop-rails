FactoryBot.define do
    factory :order_items do
      variant { association :variant }
      order { association :order }  
      quantity { 3 }  
    end
  end
  