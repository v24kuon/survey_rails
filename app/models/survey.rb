class Survey < ApplicationRecord
  # タイトルと説明の存在を検証
  validates :title, presence: true
  validates :description, presence: true
end
