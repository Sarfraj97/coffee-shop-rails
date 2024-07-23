FactoryBot.define do
  factory :variant do
    weight { 12 }
    length { 12 }
    height { 12 }
    cost_price { 1100 }
    cost_currency { "INR" }
    product { association :product }  
  end
end
