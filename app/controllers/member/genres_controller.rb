class Member::GenresController < ApplicationController
  def cake
    @cakes_shops = Shop.where(genre_id: 1).page(params[:page]).per(10)
  end

  def macaron
    @macaron_shops = Shop.where(genre_id: 2).page(params[:page]).per(10)
  end

  def chocolate
    @chocolate_shops = Shop.where(genre_id: 3).page(params[:page]).per(10)
  end

  def parfait
    @parfait_shops = Shop.where(genre_id: 4).page(params[:page]).per(10)
  end

  def cafe
    @cafe_shops = Shop.where(genre_id: 5).page(params[:page]).per(10)
  end

  def shaved_ice
    @shaved_ice_shops = Shop.where(genre_id: 6).page(params[:page]).per(10)
  end
end
