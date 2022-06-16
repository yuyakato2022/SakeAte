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
      @recipes = @alcohol.recipes
    elsif params[:latest]
      @recipes = Recipe.latest
    elsif params[:star_count]
      # @recipes = Recipe.star_count
      rank = Review.group(:recipe_id).order('avg(rate) desc')
      @recipes = Recipe.find(rank.pluck(:recipe_id))
    else
      @recipes = Recipe.all
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