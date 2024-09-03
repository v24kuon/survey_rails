class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_survey, only: [:new, :create]
  before_action :set_response, only: [:show, :edit, :update]

  def index
    @responses = current_user.responses
  end

  def show
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build(user: current_user)
  end

  def create
    Rails.logger.debug "Response params: #{response_params.inspect}"
    @response = @survey.responses.build(response_params.merge(user: current_user, status: 'completed'))
    if @response.save
      Rails.logger.debug "Response saved successfully"
      redirect_to root_path, notice: 'アンケートの回答が保存されました。'
    else
      Rails.logger.debug "Response errors: #{@response.errors.full_messages}"
      render :new
    end
  end

  def edit
  end

  def update
    if @response.update(response_params)
      redirect_to @response, notice: 'アンケートの回答が更新されました。'
    else
      render :edit
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def set_response
    @response = current_user.responses.find(params[:id])
  end

  def response_params
    params.require(:response).permit(answers: {})
  end
end
