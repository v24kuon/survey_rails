module Admins
  class QuestionsController < ApplicationController
    before_action :set_survey
    before_action :set_question, only: [:destroy]

    def destroy
      @question = Question.find(params[:id])
      @question.destroy

      respond_to do |format|
        format.html { redirect_to admins_survey_path(@question.survey), notice: '質問が削除されました。' }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@question) }
      end
    end

    private

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def set_question
      @question = @survey.questions.find(params[:id])
    end
  end
end
