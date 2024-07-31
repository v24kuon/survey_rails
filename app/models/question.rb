class Question < ApplicationRecord
  belongs_to :survey
  # 質問の種類（テキスト、選択肢など）を管理するフィールドを追加
  enum question_type: { text: 0, textarea: 1, number: 2, email: 3 }

  validates :question_title, presence: true
  validates :question_type, presence: true
end
