class Choice < ApplicationRecord
  belongs_to :question

  validates :choice_text, presence: true
  validates :order_number, presence: true
end
