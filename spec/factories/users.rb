FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    company_name { "テスト株式会社" }
    sequence(:booth_name) { |n| "テストブース#{n}" }
    booth_details { "これはテストブースの詳細です。" }
    full_name { "山田 太郎" }
    sequence(:phone) { |n| "0#{rand(1000000000..9999999999)}" }
    postal_code { "123-4567" }
    address { "東京都渋谷区テスト1-2-3" }
  end
end
