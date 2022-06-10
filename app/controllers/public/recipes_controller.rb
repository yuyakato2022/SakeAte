class Public::RecipesController < ApplicationController

  layout 'public/application'

  def top
    @alcohols = Alcohol.all
  end

  def index
    if params[:alcohol_id]
      @alcohol = Alcohol.find(params[:alcohol_id])
      @recipes = @alcohol.recipe
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end