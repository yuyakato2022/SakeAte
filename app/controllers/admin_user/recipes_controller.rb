class AdminUser::RecipesController < ApplicationController

  layout 'admin_user/application'

  def new
    @recipe = Recipe.new
    @recipe.recipe_genres.build  #recipeに紐づく中間テーブルのインスタンス生成
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_genres.build  #recipeに紐づく中間テーブルのインスタンス生成
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save
    redirect_to admin_user_recipes_path
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to admin_user_recipes_path
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to admin_user_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :explanation, :ingredient, :procedure, :image, alcohol_ids: [])
  end

end
