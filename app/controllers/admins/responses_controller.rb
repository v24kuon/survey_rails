module Admins
  class ResponsesController < ApplicationController
    before_action :authenticate_admin!

    def index
      @survey = Survey.find(params[:survey_id])
      @responses = @survey.responses.includes(:user)
    end

    def show
      @survey = Survey.find(params[:survey_id])
      @response = @survey.responses.find(params[:id])
    end
  end
end
