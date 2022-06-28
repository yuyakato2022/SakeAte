class Public::ReviewsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.recipe_id = recipe.id
    #レビューをしたか確認
    review_count = Review.where(recipe_id: params[:recipe_id]).where(user_id: current_user.id).count
    # レビューにエラーはないか
    if review.valid?
      #レビューは一回以下か
      if review_count < 1
        review.save
        redirect_to request.referer
        flash[:notice] = "レビューを保存しました"
      else
        redirect_to request.referer
        flash[:notice] = "レビューの投稿は一度までです"
      end
    else
      redirect_to request.referer
      flash[:notice] = "コメントと評価を入力してください"
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:text, :rate)
  end

end