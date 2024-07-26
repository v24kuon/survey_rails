require 'rails_helper'

RSpec.describe SurveysController, type: :request do
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
    it 'ステータスコード200を返すこと' do
      get surveys_path
      expect(response).to have_http_status(:ok)
    end

    it 'アンケート一覧ページの内容を含むこと' do
      get surveys_path
      expect(response.body).to include('アンケート一覧')
    end
  end

  describe 'GET #show' do
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
