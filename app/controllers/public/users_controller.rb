class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  layout 'public/application'

  def show
    @user = User.find(current_user.id)
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:recipe_id)
    @bookmark_list = Recipe.find(bookmarks)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to public_user_path(@user)
      flash[:notice] = " 編集完了"
    else
      render "edit"
    end
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def quit
  end

  def withdraw
    #現在ログインしているユーザーを@customerに格納
    @user = User.find(current_user.id)
     if @user.update(is_deleted: true)
       flash[:notice] = " 退会しました"
      #sessionIDのresetを行う
      reset_session
      redirect_to root_path
     else
      flash[:notice] = " 退会に失敗しました"
      render :show
     end
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
