FactoryBot.define do
  factory :answer do
    body { "Test answer" }
    question

    trait :invalid do
      body { nil }
    end
  end
end
