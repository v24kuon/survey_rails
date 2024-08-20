class Question < ApplicationRecord
  belongs_to :survey
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true
  # 質問の種類（テキスト、選択肢など）を管理するフィールドを追加
  enum question_type: {
    text: 0,
    textarea: 1,
    number: 2,
    date: 3,
    url: 4,
    email: 5,
    tel: 6,
    checkbox: 7,
    radio: 8,
    dropdown: 9,
    file: 10
  }

  validates :question_title, presence: true
  validates :question_type, presence: true
end
