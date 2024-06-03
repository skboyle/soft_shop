FactoryBot.define do
    factory :order do
      order_number { "ORD12345" }
      refunded { false }
      association :user
    end
  end
  