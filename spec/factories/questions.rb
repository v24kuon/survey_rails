FactoryBot.define do
  factory :question do
    survey { nil }
    question_title { "MyText" }
    question_type { 1 }
  end
end
