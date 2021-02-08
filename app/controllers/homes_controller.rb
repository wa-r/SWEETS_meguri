class HomesController < ApplicationController

  def top
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
    
    
    # @aves =  []
    # Shop.all.each do |shop|
    #   @aves.push shop.reviews.average(:rate).to_f.round(1)
    # end
  end
  
end

