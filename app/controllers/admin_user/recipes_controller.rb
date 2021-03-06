class AdminUser::RecipesController < ApplicationController

  before_action :set_q,only: [:index, :search]
  layout 'admin_user/application'

  def new
    @recipe = Recipe.new
    #recipeに紐づく中間テーブルのインスタンス生成
    @recipe.recipe_genres.build
  end

  def index
    @alcohols = Alcohol.all
    # お酒タグに並び替え
    if params[:alcohol_id]
      @alcohol = Alcohol.find(params[:alcohol_id])
      @recipes = @alcohol.recipes.page(params[:page]).per(20)
    # 新着順に並び替え
    elsif params[:latest]
      @recipes = Recipe.latest.page(params[:page]).per(20)
    # 全てのレシピ
    else
      @recipes = Recipe.all.page(params[:page]).per(20)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    #recipeに紐づく中間テーブルのインスタンス生成
    @recipe.recipe_genres.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to admin_user_recipe_path(@recipe)
      flash[:notice] = "レシピ登録完了"
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to admin_user_recipe_path(@recipe)
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