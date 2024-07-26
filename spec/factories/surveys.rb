FactoryBot.define do
  factory :survey do
    sequence(:title) { |n| "アンケート#{n}" }
    description { "これはアンケートの説明です。" }
  end
end
