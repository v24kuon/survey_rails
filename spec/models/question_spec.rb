require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'アソシエーション' do
    it 'surveyに属していること' do
      question = FactoryBot.build(:question)
      expect(question.survey).to be_present
    end

    it '複数のchoicesを持つこと' do
      question = FactoryBot.create(:question, :with_choices)
      expect(question.choices.count).to be > 0
    end
  end

  describe 'バリデーション' do
    it '質問タイトルと質問タイプがある場合は有効であること' do
      question = FactoryBot.build(:question)
      expect(question).to be_valid
    end

    it '質問タイトルが空の場合は無効であること' do
      question = FactoryBot.build(:question, question_title: '')
      expect(question).to be_invalid
      expect(question.errors[:question_title]).to include("を入力してください")
    end

    it '質問タイプが空の場合は無効であること' do
      question = FactoryBot.build(:question, question_type: nil)
      expect(question).to be_invalid
      expect(question.errors[:question_type]).to include("を入力してください")
    end
  end

  describe '列挙型' do
    it '定義された質問タイプが存在すること' do
      expect(Question.question_types.keys).to include('text', 'textarea', 'number', 'date', 'url', 'email', 'tel', 'checkbox', 'radio', 'dropdown', 'file')
    end
  end
end
