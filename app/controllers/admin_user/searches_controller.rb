class AdminUser::SearchesController < ApplicationController

  layout 'admin_user/application'

  before_action :set_q,only: [:index, :search]

  def search
    # ユーザー一覧ページからの検索か
    if params[:q][:view_name] == "user"
      @users = @q_user.result(distinct: true)
    # レシピ一覧ページからの検索か
    else
      @recipes = @q_recipe.result(distinct: true)
    end
  end

  private

  def set_q
    @q_user = User.ransack(params[:q])
    @q_recipe = Recipe.ransack(params[:q])
  end

end