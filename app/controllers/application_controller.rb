class ApplicationController < ActionController::Base
  
  # URLにadminが含まれるページはadminのみ
  before_action :authenticate_admin_user!, if: :admin_user_url

  def admin_user_url
    request.fullpath.include?("/admin_user")
  end

  # deviseの初期設定ではメールアドレスしか保存されないので、他の項目を増やす為の記述
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters

    if resource_class == 
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :name ])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[ :email, :name ])
    end
  end
  
end
