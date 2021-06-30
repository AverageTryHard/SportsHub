FactoryBot.define do
  factory :language do
    language_name { FFaker::String }
    locale_name { 'EN' }
    is_active { 'active' }
  end
end
