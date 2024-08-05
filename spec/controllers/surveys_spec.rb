require 'rails_helper'

RSpec.describe SurveysController, type: :request do
  let(:user) { create(:user) }
  let(:survey) { create(:survey) }

  describe 'GET #home' do
    it 'ステータスコード200を返すこと' do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it 'homeページの内容を含むこと' do
      get root_path
      expect(response.body).to include('トップページ')
    end
  end

  describe 'GET #index' do
    context 'ログインしていない場合' do
      it 'ログインページにリダイレクトすること' do
        get surveys_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'ステータスコード200を返すこと' do
        get surveys_path
        expect(response).to have_http_status(:ok)
      end

      it 'アンケート一覧ページの内容を含むこと' do
        get surveys_path
        expect(response.body).to include('アンケート一覧')
      end
    end
  end

  describe 'GET #show' do
    context 'ログインしていない場合' do
      it 'ログインページにリダイレクトすること' do
        get survey_path(survey)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'ステータスコード200を返すこと' do
        get survey_path(survey)
        expect(response).to have_http_status(:ok)
      end

      it 'アンケート詳細ページの内容を含むこと' do
        get survey_path(survey)
        expect(response.body).to include(survey.title)
      end
    end
  end
end
