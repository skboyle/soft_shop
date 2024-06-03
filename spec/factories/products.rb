FactoryBot.define do
    factory :product do
      title { "Sample Product" }
      category { "Software" }
      featured { false }
      product_code { "SP123" }
      description { "This is a sample product." }
      specifications { "Specs" }
      operating_system { "Windows" }
      price { 99.99 }
      cost { 49.99 }
      msrp { 109.99 }
      sale_count { 0 }
      association :manufacturer, factory: :manufacturer
  
      trait :featured do
        featured { true }
      end
    end
  end
  