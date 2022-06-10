class Public::ReviewsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.save
    redirect_to public_recipe_path(recipe.id)
  end

  private

  def review_params
    params.require(:review).permit(:text)
  end

end


