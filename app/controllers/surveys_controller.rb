class SurveysController < ApplicationController
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
end
