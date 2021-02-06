class HomesController < ApplicationController

  def top
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end

end