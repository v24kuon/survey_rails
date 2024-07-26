module Admins
  class SurveysController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_survey, only: [:show, :edit, :update, :destroy]

    # GET /admin/surveys
    def index
      @surveys = Survey.all
      render 'admin_index'
    end

  def show
    @survey = Survey.find(params[:id])
  end

    # GET /admin/surveys/new
    def new
      @survey = Survey.new
      @survey.questions.build
    end

    # POST /admin/surveys
    def create
      @survey = Survey.new(survey_params)
      respond_to do |format|
        if @survey.save
          format.html { redirect_to admins_surveys_path, notice: "Survey was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # GET /admin/surveys/:id/edit
    def edit
    end

    # PATCH/PUT /admin/surveys/:id
    def update
      respond_to do |format|
        if @survey.update(survey_params)
          format.html { redirect_to admins_surveys_path, notice: "Survey was successfully updated." }
          format.json { render :show, status: :ok, location: @survey }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @survey.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/surveys/:id
    def destroy
      @survey.destroy!
      respond_to do |format|
        format.html { redirect_to admins_surveys_path, notice: "Survey was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:title, questions_attributes: [:id, :question_title, :question_type, :_destroy])
    end
  end
end
