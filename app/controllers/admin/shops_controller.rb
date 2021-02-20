class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @shops = Shop.all.page(params[:page]).per(10)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shop_path(@shop), noice: "店舗情報を登録しました"
    else
      flash.now[:alert] = "店舗情報の登録を失敗しました"
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    @genres = Genre.all
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to admin_shop_path(@shop), noice: "店舗情報を更新しました"
    else
      flash.now[:alert] = "店舗情報の更新を失敗しました"
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to request.referer, notice: "店舗情報を削除しました"
  end

  private

  def shop_params
    params.require(:shop).permit(
      :genre_id,
      :name,
      :phone_number,
      :address,
      :latitude,
      :longitude,
      :nearest_station,
      :business_hours,
      :regular_holiday,
      :main_image,
      :caption,
      shop_images_images: []
    )
  end
end
