class Public::ReviewsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.recipe_id = recipe.id
    review.save
    redirect_to public_recipe_path(recipe.id)
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:text)
  end

end