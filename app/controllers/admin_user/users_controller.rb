class AdminUser::UsersController < ApplicationController

  layout 'admin_user/application'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.all
  end

  def edit
    @user = User.find(params[:id])
  end

  
  enddef update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to admin_user_users_path
    else
      render "edit"
    end

  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end

end
