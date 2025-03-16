FactoryBot.define do
  factory :answer do
    body { "Test answer" }
    question
    user

    trait :invalid do
      body { nil }
    end
  end
end
