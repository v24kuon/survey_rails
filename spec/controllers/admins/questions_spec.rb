require 'rails_helper'

RSpec.describe Admins::QuestionsController, type: :request do
  let(:admin) { create(:admin) }
  let!(:survey) { create(:survey) }
  let!(:question) { create(:question, survey: survey) }

  before do
    sign_in admin
  end

  describe 'DELETE #destroy' do
    it '質問を削除すること' do
      expect {
        delete admins_survey_question_path(survey, question)
      }.to change(Question, :count).by(-1)
    end

    it '成功メッセージを表示すること' do
      delete admins_survey_question_path(survey, question)
      expect(flash[:notice]).to eq '質問が削除されました。'
    end

    context 'Turbo Streamリクエストの場合' do
      it 'Turbo Streamレスポンスを返すこと' do
        delete admins_survey_question_path(survey, question), headers: { 'Accept': 'text/vnd.turbo-stream.html' }
        expect(response.media_type).to eq 'text/vnd.turbo-stream.html'
      end

      it '削除された質問のTurbo Stream要素を含むこと' do
        delete admins_survey_question_path(survey, question), headers: { 'Accept': 'text/vnd.turbo-stream.html' }
        expect(response.body).to include "turbo-stream action=\"remove\""
        expect(response.body).to include "target=\"question_#{question.id}\""
      end
    end
  end
end
