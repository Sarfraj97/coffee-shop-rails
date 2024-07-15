FactoryBot.define do
    factory :product do
      name { "Sample Product" }
      category { association :category }  
    end
  end
  