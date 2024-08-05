class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authorize_user, only: [:show]

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    unless current_user == @user
      redirect_to root_path, alert: 'アクセス権限がありません。'
    end
  end
end
