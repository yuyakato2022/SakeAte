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
      @pages = @recipes
    elsif params[:latest]
      @recipes = Recipe.latest.page(params[:page]).per(10)
      @pages = @recipes
    elsif params[:star_count]
      ranks = Review.group(:recipe_id).order('avg(rate) desc').page(params[:page]).per(10)
      @recipes = Array.new
      ranks.each do |rank|
        @recipes.push(Recipe.find(rank.recipe_id))
      end
       @pages = ranks
    else
      @recipes = Recipe.all.page(params[:page])
      @pages = @recipes
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