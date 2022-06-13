class Public::UsersController < ApplicationController

  layout 'public/application'

  def show
    @user = User.find(current_user.id)
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:recipe_id)
    @bookmark_list = Recipe.find(bookmarks)
  end

  def edit
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

end
