require 'rails_helper'

RSpec.describe Admins::QuestionsController, type: :request do
  let(:admin) { create(:admin) }
  let!(:survey) { create(:survey) }

  before do
    sign_in admin
  end

  describe 'POST #create' do
    it 'HTTPステータス200を返すこと' do
      post admins_question_path(0), xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'Turbo Streamレスポンスを返すこと' do
      post admins_question_path(0), xhr: true
      expect(response.media_type).to eq Mime[:turbo_stream]
    end

    it '新しい質問フォームを含むこと' do
      post admins_question_path(0), xhr: true
      expect(response.body).to include('question_title')
      expect(response.body).to include('question_type')
    end
  end

  describe 'DELETE #destroy' do
    it 'HTTPステータス200を返すこと' do
      delete admins_question_path(0), xhr: true
      expect(response).to have_http_status(:success)
    end

    it '質問の削除フォームを含むこと' do
      delete admins_question_path(0), xhr: true
      expect(response.body).to include('_destroy')
      expect(response.body).to include('hidden')
    end
  end
end
