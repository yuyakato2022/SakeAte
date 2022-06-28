class Public::UsersController < ApplicationController

  layout 'public/application'

  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    # ユーザーお気に入り一覧
    recipes = Recipe.where(id: @user.bookmarks.pluck(:recipe_id))
    @bookmark_list = recipes.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to public_user_path
      flash[:notice] = " 編集完了"
    else
      render :edit
    end
  end

  # 退会ページ
  def quit
  end
  # 会員ステータス更新
  def withdraw
    @user = User.find(current_user.id)
    #sessionIDのresetを行う
    if @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
      flash[:notice] = " 退会しました"
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end