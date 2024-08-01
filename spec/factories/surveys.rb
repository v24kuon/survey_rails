FactoryBot.define do
  factory :survey do
    sequence(:title) { |n| "アンケート#{n}" }
    description { "これはアンケートの説明です。" }
    summary { "これはアンケートの概要です。" }
    trait :with_question do
      after(:build) do |survey|
        survey.questions << build(:question)
      end
    end
  end
end
