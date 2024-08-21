FactoryBot.define do
  factory :question do
    question_title { "サンプル質問" }
    question_type { :text }
    association :survey

    trait :with_choices do
      after(:create) do |question|
        create_list(:choice, 3, question: question)
      end
    end
  end
end
