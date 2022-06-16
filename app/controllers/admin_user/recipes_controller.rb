class AdminUser::RecipesController < ApplicationController

  before_action :set_q,only: [:index, :search]
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
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to admin_user_recipes_path
      flash[:notice] = "レシピ登録完了"
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to admin_user_recipes_path
      flash[:notice] = "編集完了"
    else
      render :edit
    end
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

  def set_q
    @q_recipe = Recipe.ransack(params[:q])
  end

end
