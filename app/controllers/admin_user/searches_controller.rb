class AdminUser::SearchesController < ApplicationController

  layout 'admin_user/application'

  before_action :set_q,only: [:index, :search]

  def search
    @recipes = @q_recipe.result(distinct: true)
    @users = @q_user.result(distinct: true)
  end

  private

  def set_q
    @q_user = User.ransack(params[:q])
    @q_recipe = Recipe.ransack(params[:q])
  end

end
