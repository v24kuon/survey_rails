FactoryBot.define do
  factory :choice do
    choice_text { "選択肢のテキスト" }
    order_number { 1 }
    association :question
  end
end
