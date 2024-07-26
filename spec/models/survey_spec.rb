require 'rails_helper'

RSpec.describe Survey, type: :model do
  # テスト対象のモデルの説明
  describe 'バリデーション' do
    # タイトルの存在性テスト
    it 'タイトルが存在する場合は有効であること' do
      survey = Survey.new(title: '有効なタイトル', description: '有効な説明')
      expect(survey).to be_valid
    end

    it 'タイトルが空の場合は無効であること' do
      survey = Survey.new(title: '', description: '有効な説明')
      expect(survey).to be_invalid
      expect(survey.errors[:title]).to include("can't be blank")
    end

    # 説明の存在性テスト
    it '説明が存在する場合は有効であること' do
      survey = Survey.new(title: '有効なタイトル', description: '有効な説明')
      expect(survey).to be_valid
    end

    it '説明が空の場合は無効であること' do
      survey = Survey.new(title: '有効なタイトル', description: '')
      expect(survey).to be_invalid
      expect(survey.errors[:description]).to include("can't be blank")
    end
  end
end
