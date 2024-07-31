class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

  # タイトルと説明の存在を検証
  validates :title, presence: true
  validates :description, presence: true
end
