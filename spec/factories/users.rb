FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    password { 'test123' }
    status { 'active' }

    trait :confirmed do
      after(:create, &:confirm)
    end

    trait :admin do
      is_admin { true }
    end

    factory :confirmed_user, traits: [:confirmed]
    factory :confirmed_admin, traits: [:admin, :confirmed]
  end
end
