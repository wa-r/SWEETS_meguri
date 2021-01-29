class HomesController < ApplicationController

  def top
    @q = Shop.ransack(params[:q])
    @shops = @q.result(didtinct: true)
  end

end
