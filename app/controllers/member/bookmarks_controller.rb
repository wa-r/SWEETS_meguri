class Member::BookmarksController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    bookmark = current_member.bookmarks.build(shop_id: @shop.id)
    bookmark.save
    redirect_to request.referer
  end
  
  def destroy
    @shop = Shop.find(params[:shop_id])
    bookmark = current_member.bookmarks.find_by(shop_id: @shop.id)
    bookmark.destroy
    redirect_to request.referer
  end
  
end
