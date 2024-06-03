FactoryBot.define do
    factory :ticket do
      status { "Open" }
      awaiting_response { true }
      notes { "Initial ticket notes" }
      resolution { "Sample resolution" }
      association :order
    end
  end