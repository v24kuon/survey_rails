require 'rails_helper'

RSpec.describe "Admins::Questions", type: :request do
  let(:admin) { create(:admin) }
  let!(:survey) { create(:survey) }
  let!(:question) { create(:question, survey: survey) }

  before do
    sign_in admin
  end

  describe 'GET #new' do
    it 'Turbo Streamレスポンスを返すこと' do
      get new_admins_question_path, headers: { 'Accept': 'text/vnd.turbo-stream.html' }
      expect(response).to have_http_status(:success)
      expect(response.media_type).to eq 'text/vnd.turbo-stream.html'
    end

    it '新しい質問フォームのHTMLを含むこと' do
      get new_admins_question_path, headers: { 'Accept': 'text/vnd.turbo-stream.html' }
      expect(response.body).to include 'turbo-stream action="append"'
      expect(response.body).to include 'target="new_questions"'
      expect(response.body).to include '<form'
      expect(response.body).to include '[question_title]'
      expect(response.body).to include '[question_type]'
      expect(response.body).to include '[is_required]'
    end
  end

  describe 'DELETE #destroy' do
    it '質問を削除すること' do
      expect {
        delete admins_question_path(question)
      }.to change(Question, :count).by(-1)
    end

    it 'サーベイ一覧ページにリダイレクトすること' do
      delete admins_question_path(question)
      expect(response).to redirect_to(admins_surveys_path)
    end

    it '成功メッセージを表示すること' do
      delete admins_question_path(question)
      expect(flash[:notice]).to eq 'Question was successfully destroyed.'
    end

    context 'Turbo Streamリクエストの場合' do
      it 'Turbo Streamレスポンスを返すこと' do
        delete admins_question_path(question), headers: { 'Accept': 'text/vnd.turbo-stream.html' }
        expect(response.media_type).to eq 'text/vnd.turbo-stream.html'
      end

      it '削除された質問のTurbo Stream要素を含むこと' do
        delete admins_question_path(question), headers: { 'Accept': 'text/vnd.turbo-stream.html' }
        expect(response.body).to include "turbo-stream action=\"remove\""
        expect(response.body).to include "target=\"question_#{question.id}\""
      end
    end
  end
end
