module Admins
  class QuestionsController < ApplicationController
    before_action :set_question, only: [:destroy]

    def new
      @question = Question.new
      @index = Time.now.to_i
    end

    def destroy
      @question.destroy!

      respond_to do |format|
        format.html { redirect_to admins_surveys_path, notice: "Question was successfully destroyed." }
        format.json { head :no_content }
        format.turbo_stream
      end
    end

    private
    def set_question
      @question = Question.find(params[:id])
    end
  end
end
