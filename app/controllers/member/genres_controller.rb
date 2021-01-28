class Member::GenresController < ApplicationController
  
  def cake
    @genre_cakes = Shop.where(genre_id: 1)
  end
  
  def macaron
  end
  
  def chocolate
  end
  
  def parfait
  end
  
  def cafe
  end
  
  def shaved_ice
  end
  
  def other
  end
  
end
