require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'バリデーション' do

    it '質問タイトルが空の場合は無効であること' do
      question = build(:question, question_title: '')
      expect(question).to be_invalid
      expect(question.errors[:question_title]).to include("を入力してください")
    end

    it '質問タイプが空の場合は無効であること' do
      question = build(:question, question_type: nil)
      expect(question).to be_invalid
      expect(question.errors[:question_type]).to include("を入力してください")
    end

    it '質問タイトルと質問タイプが両方空の場合は無効であること' do
      question = build(:question, question_title: '', question_type: nil)
      expect(question).to be_invalid
      expect(question.errors[:question_title]).to include("を入力してください")
      expect(question.errors[:question_type]).to include("を入力してください")
    end
  end
end
