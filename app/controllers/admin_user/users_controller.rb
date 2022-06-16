class AdminUser::UsersController < ApplicationController

  before_action :set_q,only: [:index, :search]
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


  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_users_path
    flash[:notice] = "ステータス変更完了"
  end

  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end

  def set_q
    @q_user = User.ransack(params[:q])
  end

end
