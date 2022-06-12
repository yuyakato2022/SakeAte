class Public::RecipesController < ApplicationController

#   before_action :search
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
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
  end

  def search
    @recipes = @q.result(distinct: true)
  end

private

  def set_q
    @q = Recipe.ransack(params[:q])
  end

end