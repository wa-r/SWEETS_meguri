class Member::NotificationsController < ApplicationController

  def index
    @notifications = current_member.passive_notifications.order(id: 'DESC').page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

end
