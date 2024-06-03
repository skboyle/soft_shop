FactoryBot.define do
    factory :manufacturer do
        endpoint { "https://api.manufacturer.com" }
        contact_name { "Manufacturer Contact" }
        contact_email { "contact@manufacturer.com" }
  
        after(:build) do |manufacturer|
            if manufacturer.logo.attached?
              manufacturer.logo.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'sample_logo.png')), filename: 'sample_logo.png', content_type: 'image/png')
            end
          end
    end
  end