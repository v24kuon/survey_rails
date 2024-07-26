require 'rails_helper'

RSpec.describe Admins::SurveysController, type: :request do
  let(:admin) { create(:admin) }
  let!(:survey) { create(:survey) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it '正常なレスポンスを返すこと' do
      get admins_surveys_path
      expect(response).to have_http_status(:ok)
    end

    it 'アンケート一覧を表示すること' do
      get admins_surveys_path
      expect(response.body).to include(survey.title)
    end
  end

  describe 'GET #show' do
    it '正常なレスポンスを返すこと' do
      get admins_survey_path(survey)
      expect(response).to have_http_status(:ok)
    end

    it 'アンケートの詳細を表示すること' do
      get admins_survey_path(survey)
      expect(response.body).to include(survey.title)
      expect(response.body).to include(survey.description)
    end
  end

  describe 'GET #new' do
    it '正常なレスポンスを返すこと' do
      get new_admins_survey_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context '有効なパラメータの場合' do
      it '新しいアンケートを作成すること' do
        expect {
          post admins_surveys_path, params: { survey: attributes_for(:survey) }
        }.to change(Survey, :count).by(1)
      end

      it 'アンケート一覧ページにリダイレクトすること' do
        post admins_surveys_path, params: { survey: attributes_for(:survey) }
        expect(response).to redirect_to(admins_surveys_path)
      end
    end

    context '無効なパラメータの場合' do
      it '新しいアンケートを作成しないこと' do
        expect {
          post admins_surveys_path, params: { survey: attributes_for(:survey, title: nil) }
        }.not_to change(Survey, :count)
      end

      it 'エラーを表示すること' do
        post admins_surveys_path, params: { survey: attributes_for(:survey, title: nil) }
        expect(response.body).to include('')
      end
    end
  end

  describe 'GET #edit' do
    it '正常なレスポンスを返すこと' do
      get edit_admins_survey_path(survey)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH #update' do
    context '有効なパラメータの場合' do
      it 'アンケートを更新すること' do
        patch admins_survey_path(survey), params: { survey: { title: '新しいタイトル' } }
        survey.reload
        expect(survey.title).to eq '新しいタイトル'
      end

      it 'アンケート一覧ページにリダイレクトすること' do
        patch admins_survey_path(survey), params: { survey: { title: '新しいタイトル' } }
        expect(response).to redirect_to(admins_surveys_path)
      end
    end

    context '無効なパラメータの場合' do
      it 'アンケートを更新しないこと' do
        patch admins_survey_path(survey), params: { survey: { title: nil } }
        survey.reload
        expect(survey.title).not_to be_nil
      end

      it 'エラーを表示すること' do
        patch admins_survey_path(survey), params: { survey: { title: nil } }
        expect(response.body).to include('')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'アンケートを削除すること' do
      expect {
        delete admins_survey_path(survey)
      }.to change(Survey, :count).by(-1)
    end

    it 'アンケート一覧ページにリダイレクトすること' do
      delete admins_survey_path(survey)
      expect(response).to redirect_to(admins_surveys_path)
    end
  end
end
