class Member::GenresController < ApplicationController
  
  def cake
    @cakes_shops = Shop.where(genre_id: 1)
  end
  
  def macaron
    @macaron_shops = Shop.where(genre_id: 2)
  end
  
  def chocolate
    @chocolate_shops = Shop.where(genre_id: 3)
  end
  
  def parfait
    @parfait_shops = Shop.where(genre_id: 4)
  end
  
  def cafe
    @cafe_shops = Shop.where(genre_id: 5)
  end
  
  def shaved_ice
    @shaved_ice_shops = Shop.where(genre_id: 6)
  end

end
