module Admins
  class ChoicesController < ApplicationController
    before_action :authenticate_admin!
    before_action :setup_question

    def new
    end

    def destroy
    end

    private

    def setup_question
      @survey = Survey.new(questions: [Question.new(choices: [Choice.new])])
    end
  end
end
