FactoryBot.define do
  factory :language do
    language_name { FFaker::String }
    locale_name { 'EN' }
    status { 'active' }
  end
end
