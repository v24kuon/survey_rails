module Admins
  class ChoicesController < ApplicationController
    before_action :set_choice, only: [:destroy]

    def new
      @choice = Choice.new
      @index = params[:index] || Time.now.to_i
    end

    def destroy
      @choice.destroy!

      respond_to do |format|
        format.html { redirect_to admins_surveys_path, notice: "Question was successfully destroyed." }
        format.json { head :no_content }
        format.turbo_stream
      end
    end

    private
    def set_choice
      @choice = Choice.find(params[:id])
    end
  end
end
