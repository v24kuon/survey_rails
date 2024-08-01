require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe 'バリデーション' do
    it 'ファクトリで作成したsurveyが有効であること' do
      expect(build(:survey)).to be_valid
    end

    it 'タイトルが空の場合は無効であること' do
      survey = build(:survey, title: '')
      expect(survey).to be_invalid
      expect(survey.errors[:title]).to include("を入力してください")
    end

    it '説明が空の場合は無効であること' do
      survey = build(:survey, description: '')
      expect(survey).to be_invalid
      expect(survey.errors[:description]).to include("を入力してください")
    end

    # summaryのテストを追加
    it 'サマリーが空の場合は無効であること' do
      survey = build(:survey, summary: '')
      expect(survey).to be_invalid
      expect(survey.errors[:summary]).to include("を入力してください")
    end

    context 'すべての属性が存在する場合' do
      it 'タイトル、サマリー、説明、質問タイトル、質問タイプが存在する場合は有効であること' do
        survey = build(:survey,
          title: '有効なタイトル',
          summary: '有効なサマリー',
          description: '有効な説明',
          questions_attributes: [
            {
              question_title: '有効な質問タイトル',
              question_type: 'text'
            }
          ]
        )
        expect(survey).to be_valid
      end
    end
  end
end
