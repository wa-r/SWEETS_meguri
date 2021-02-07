class Member::ShopsController < ApplicationController

  def index
    @shops = Shop.all.page(params[:page]).per(1)

  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end

  def search
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).page(params[:page]).per(10)
  end

  private

  def shops_params
    params.require(:shop).permit(:genre_id, :name, :phone_number, :address, :latitude, :longitude, :nearest_station, :business_hours, :regular_holiday, :main_image_id, :caption, shop_images_images: [])
  end

end
