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
    end

    # GET /admin/surveys/new
    def new
      @survey = Survey.new(questions: [Question.new])
    end

    # POST /admin/surveys
    def create
      @survey = Survey.new(survey_params)
      if @survey.save
        redirect_to admins_surveys_path, notice: "アンケートが正常に作成されました。"
      else
        render :new, status: :unprocessable_entity
      end
    end

    # GET /admin/surveys/:id/edit
    def edit
    end

    # PATCH/PUT /admin/surveys/:id
    def update
      if @survey.update(survey_params)
        redirect_to admins_survey_path(@survey), notice: "アンケートが正常に更新されました。"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /admin/surveys/:id
    def destroy
      @survey.destroy
      redirect_to admins_surveys_path, notice: "アンケートが正常に削除されました。"
    end

    private

    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(
        :title, :description, :summary,
        questions_attributes: [:id, :question_title, :question_type, :_destroy,
          choices_attributes: [:id, :choice_text, :order_number, :_destroy]]
      )
    end
  end
end
