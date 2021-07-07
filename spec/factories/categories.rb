FactoryBot.define do
  factory :category do
    name { FFaker::String }

    trait :sub_category do
      association :parent_category, factory: :category
    end
  end
end
