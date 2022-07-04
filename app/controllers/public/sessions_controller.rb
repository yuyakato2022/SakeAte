# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController

  layout 'public/application'
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  # 退会しているかを判断
  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.is_deleted?
      redirect_to new_user_registration_path
      flash[:notice] = "退会済みです。新規会員登録を行なってください"
    else
    end
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    public_recipes_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = " ログアウトしました"
    root_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end