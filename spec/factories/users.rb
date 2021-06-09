FactoryBot.define do
  factory :index do
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    password { 'test123' }
  end
end
