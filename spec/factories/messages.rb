FactoryBot.define do
    factory :message do
      content { "Sample message content" }
      association :ticket
    end
  end
  