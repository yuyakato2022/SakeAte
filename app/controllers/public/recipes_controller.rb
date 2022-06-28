class Public::RecipesController < ApplicationController

  layout 'public/application'

  before_action :authenticate_user!, except: [:top]
  before_action :set_q,only: [:index, :search]

  def top
    @alcohols = Alcohol.all
  end

  def index
    @alcohols = Alcohol.all
    # お酒タグに並び替え
    if params[:alcohol_id]
      @alcohol = Alcohol.find(params[:alcohol_id])
      @recipes = @alcohol.recipes.page(params[:page]).per(10)
    # 新着順に並び替え
    elsif params[:latest]
      @recipes = Recipe.latest.page(params[:page]).per(10)
    # ランキング順に並び替え
    elsif params[:star_count]
      @recipes = Recipe.star_count.page(params[:page]).per(10)
    # 全てのレシピ
    else
      @recipes = Recipe.all.page(params[:page]).per(10)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
  end

private

  def set_q
    @q = Recipe.ransack(params[:q])
  end

end