class Public::BookmarksController < ApplicationController

  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    bookmark = current_user.bookmarks.new(recipe_id: @recipe.id)
    bookmark.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    bookmark = current_user.bookmarks.find_by(recipe_id: @recipe.id)
    bookmark.destroy
  end

end