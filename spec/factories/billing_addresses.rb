FactoryBot.define do
    factory :billing_address do
      first_name { "John" }
      last_name { "Doe" }
      address_line_one { "123 Main St" }
      address_line_two { "Apt 4B" }
      state { "CA" }
      zip_code { "12345" }
      country { "USA" }
      association :user
      association :order
    end
  end
  