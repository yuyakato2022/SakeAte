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
    @alcohol = Alcohol.new(alcohol_params)
    if @alcohol.save
      redirect_to admin_user_alcohols_path
      flash[:notice] = "お酒登録完了"
    else
      @alcohols = Alcohol.all
      render :index
    end
  end

  def update
    @alcohol = Alcohol.find(params[:id])
    if @alcohol.update(alcohol_params)
      redirect_to admin_user_alcohols_path
      flash[:notice] = "お酒変更完了"
    else
      render :edit
    end
  end

  private

  def alcohol_params
    params.require(:alcohol).permit(:name)
  end

end
