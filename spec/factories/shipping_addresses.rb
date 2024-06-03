FactoryBot.define do
    factory :shipping_address do
      first_name { "Jane" }
      last_name { "Doe" }
      address_line_one { "456 Elm St" }
      address_line_two { "" }
      state { "CA" }
      zip_code { "67890" }
      country { "USA" }
      association :user
    end
  end
  