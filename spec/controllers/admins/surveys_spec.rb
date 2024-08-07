require 'rails_helper'

RSpec.describe Admins::SurveysController, type: :request do
  let(:admin) { create(:admin) }
  let!(:survey) { create(:survey, :with_question) }

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
      expect(response.body).to include(survey.summary) # summaryの確認を追加
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
      let(:valid_attributes) do
        attributes_for(:survey).merge(
          summary: 'テストサマリー', # summaryを追加
          questions_attributes: [attributes_for(:question)]
        )
      end

      it '新しいアンケートを作成すること' do
        expect {
          post admins_surveys_path, params: { survey: valid_attributes }
        }.to change(Survey, :count).by(1).and change(Question, :count).by(1)
      end

      it 'アンケート一覧ページにリダイレクトすること' do
        post admins_surveys_path, params: { survey: valid_attributes }
        expect(response).to redirect_to(admins_surveys_path)
      end

      # summaryが正しく設定されることを確認するテストを追加
      it '新しいアンケートが正しく作成されること' do
        post admins_surveys_path, params: { survey: valid_attributes }
        expect(Survey.last.summary).to eq 'テストサマリー'
      end
    end

    context '無効なパラメータの場合' do
      let(:invalid_attributes) do
        attributes_for(:survey, title: nil).merge(
          questions_attributes: [attributes_for(:question, question_title: nil)]
        )
      end

      it '新しいアンケートを作成しないこと' do
        expect {
          post admins_surveys_path, params: { survey: invalid_attributes }
        }.to change(Survey, :count).by(0).and change(Question, :count).by(0)
      end

      it 'エラーを表示すること' do
        post admins_surveys_path, params: { survey: invalid_attributes }
        expect(response.body).to include('を入力してください')
      end
    end
  end

  describe 'PATCH #update' do
    context '有効なパラメータの場合' do
      let(:new_attributes) do
        {
          title: '新しいタイトル',
          summary: '新しいサマリー', # summaryを追加
          questions_attributes: [
            { id: survey.questions.first.id, question_title: '新しい質問タイトル' }
          ]
        }
      end

      it 'アンケートを更新すること' do
        patch admins_survey_path(survey), params: { survey: new_attributes }
        survey.reload
        expect(survey.title).to eq '新しいタイトル'
        expect(survey.summary).to eq '新しいサマリー' # summaryの確認を追加
        expect(survey.questions.first.question_title).to eq '新しい質問タイトル'
      end

      it 'アンケート一覧ページにリダイレクトすること' do
        patch admins_survey_path(survey), params: { survey: new_attributes }
        expect(response).to redirect_to(admins_surveys_path)
      end
    end

    context '無効なパラメータの場合' do
      let(:invalid_attributes) do
        { title: nil, questions_attributes: [{ id: survey.questions.first.id, question_title: nil }] }
      end

      it 'アンケートを更新しないこと' do
        patch admins_survey_path(survey), params: { survey: invalid_attributes }
        survey.reload
        expect(survey.title).not_to be_nil
        expect(survey.questions.first.question_title).not_to be_nil
      end

      it 'エラーを表示すること' do
        patch admins_survey_path(survey), params: { survey: invalid_attributes }
        expect(response.body).to include('を入力してください')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'アンケートを削除すること' do
      expect {
        delete admins_survey_path(survey)
      }.to change(Survey, :count).by(-1).and change(Question, :count).by(-1)
    end

    it 'アンケート一覧ページにリダイレクトすること' do
      delete admins_survey_path(survey)
      expect(response).to redirect_to(admins_surveys_path)
    end
  end
end
