FactoryBot.define do
  factory :comment do
    body { FFaker::String }
    commentable { nil }
  end
end
