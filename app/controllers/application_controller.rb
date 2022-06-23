class ApplicationController < ActionController::Base

  # URLにadminが含まれるページはadminのみ
  before_action :authenticate_admin_user!, if: :admin_user_url

  def admin_user_url
    request.fullpath.include?("/admin_user")
  end



  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end

end
