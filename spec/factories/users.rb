FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "test#{n}@example.com" }
      password { "password" }
      admin { false }
  
      trait :admin do
        admin { true }
      end
    end
  end