class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :admin_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :booth_name, :booth_details, :full_name, :phone, :postal_code, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:company_name, :booth_name, :booth_details, :full_name, :phone, :postal_code, :address])
  end
end
