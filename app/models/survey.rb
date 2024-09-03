class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :users, through: :responses
  accepts_nested_attributes_for :questions, allow_destroy: true,reject_if: :all_blank

  # タイトルと説明の存在を検証
  validates :title, presence: true
  validates :description, presence: true
  validates :summary, presence: true
end
