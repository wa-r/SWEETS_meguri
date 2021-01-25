class Member::ReviewsController < ApplicationController

  def index
    # @shop = Shop.find(params[id: :shop_id])
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    shop = Shop.find(params[:shop_id])
    review = current_member.reviews.new(review_params)
    review.shop_id = shop.id
    review.save
    redirect_to shop_reviews_path
  end

  def edit
  end

  def updated
  end

  def destroy
  end

  private
  def revuew_params
    params.require(:review).permit(:title, :content, :rate)
  end

end
