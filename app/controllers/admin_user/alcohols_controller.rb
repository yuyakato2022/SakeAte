class AdminUser::AlcoholsController < ApplicationController
  
  layout 'admin_user/application'

  def index
    @alcohol = Alcohol.new
    @alcohols = Alcohol.all
  end

  def edit
    @alcohol = Alcohol.find(params[:id])
  end

  def create
    alcohol = Alcohol.new(alcohol_params)
    alcohol.save
    redirect_to admin_user_alcohols_path
  end

  def update
    alcohol = Alcohol.find(params[:id])
    alcohol.update(alcohol_params)
    redirect_to admin_user_alcohols_path
  end

  private

  def alcohol_params
    params.require(:alcohol).permit(:name)
  end

end
