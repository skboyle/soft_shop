FactoryBot.define do
    factory :promotion do
      start_date { 1.week.ago }
      end_date { 1.week.from_now }
      discount_amount { 20.0 }
    end
  end
  