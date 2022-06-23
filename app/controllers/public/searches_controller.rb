class Public::SearchesController < ApplicationController

  layout 'public/application'
  before_action :authenticate_user!
  before_action :set_q,only: [:search]

  def search
     @recipes = @q.result(distinct: true)
  end

  private

  def set_q
    @q = Recipe.ransack(params[:q])
  end

end
