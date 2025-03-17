FactoryBot.define do
  factory :question do
    title { "Test question" }
    body { "Test question" }
    user

    trait :invalid do
      title { nil }
    end
  end
end
