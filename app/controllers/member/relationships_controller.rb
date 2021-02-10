class Member::RelationshipsController < ApplicationController

  def create
    follow = current_member.active_relationships.new(follower_id: params[:member_id])
    follow.save
    follow.create_notification_follow!(current_member)
    redirect_to request.referer
    
  end

  def destroy
    follow = current_member.active_relationships.find_by(follower_id: params[:member_id])
    follow.destroy
    redirect_to request.referer
  end

end