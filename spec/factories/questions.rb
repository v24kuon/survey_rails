FactoryBot.define do
  factory :question do
    question_title { "有効な質問タイトル" }
    question_type { "text" }
    is_required { true }
  end
end
