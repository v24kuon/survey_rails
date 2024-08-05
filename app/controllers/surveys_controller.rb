class SurveysController < ApplicationController
  before_action :authenticate_user_or_admin!, except: [:home]
  before_action :set_survey, only: [:show]

  def home
    @surveys = Survey.all
  end

  # GET /surveys or /surveys.json
  def index
    @surveys = Survey.all
    render 'user_index'
  end

  # GET /surveys/1 or /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def authenticate_user_or_admin!
    unless user_signed_in? || admin_signed_in?
      redirect_to new_user_session_path, alert: 'ログインが必要です。'
    end
  end
end
