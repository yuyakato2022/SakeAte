class Public::RecipesController < ApplicationController

  before_action :authenticate_user!, except: [:top]
  before_action :set_q,only: [:index, :search]
  layout 'public/application'

  def top
    @alcohols = Alcohol.all
  end

  def index
    @alcohols = Alcohol.all

    if params[:alcohol_id]
      @alcohol = Alcohol.find(params[:alcohol_id])
      @recipes = @alcohol.recipes.page(params[:page]).per(10)
    elsif params[:latest]
      @recipes = Recipe.latest.page(params[:page]).per(10)
    elsif params[:star_count]
      rank = Review.group(:recipe_id).order('avg(rate) desc')
      recipe = Recipe.where(id: rank.pluck(:recipe_id))
      @recipes = recipe.page(params[:page]).per(10)
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