class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :company_name, presence: true
  validates :booth_name, presence: true
  validates :full_name, presence: true
  validates :phone, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end
