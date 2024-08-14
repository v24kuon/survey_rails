module Admins
  class QuestionsController < ApplicationController
    before_action :authenticate_admin!
    before_action :setup_survey

    def new
    end

    def destroy
    end

    private

    def setup_survey
      @survey = Survey.new(questions: [Question.new])
    end
  end
end
