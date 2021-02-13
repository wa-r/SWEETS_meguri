class HomesController < ApplicationController
  def top
    # ransackの検索用記述
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)

    # shopのランキング形式用
    @shops = Shop.all
    @shops_rank = @shops.sort_by do |shop|
      shop.reviews.average(:rate).nil? ? 0 : shop.reviews.average(:rate)
    end.reverse
  end
end
