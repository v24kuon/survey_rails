require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe 'アソシエーション' do
    it 'questionに属していること' do
      choice = FactoryBot.build(:choice)
      expect(choice.question).to be_present
    end
  end

  describe 'バリデーション' do
    it 'choice_textが存在する場合は有効であること' do
      choice = FactoryBot.build(:choice)
      expect(choice).to be_valid
    end

    it 'choice_textが存在しない場合は無効であること' do
      choice = FactoryBot.build(:choice, choice_text: nil)
      expect(choice).to be_invalid
      expect(choice.errors[:choice_text]).to include("を入力してください")
    end

    it 'order_numberが存在する場合は有効であること' do
      choice = FactoryBot.build(:choice)
      expect(choice).to be_valid
    end

    it 'order_numberが存在しない場合は無効であること' do
      choice = FactoryBot.build(:choice, order_number: nil)
      expect(choice).to be_invalid
      expect(choice.errors[:order_number]).to include("を入力してください")
    end
  end
end
