class HomesController < ApplicationController

  def top
    # ransackの検索用記述
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)

    # shopのランキング形式用
    @shops = Shop.all
    @shops_rank = @shops.sort_by { |shop|
      shop.reviews.average(:rate)
    }.reverse
  end
end
