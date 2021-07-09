FactoryBot.define do
  factory :article do
    headline { FFaker::String }
    alt_text { FFaker::String }
    caption { FFaker::String }
    content { FFaker::String }
    category { create(:category) }
    location { create(:location) }
  end
end
