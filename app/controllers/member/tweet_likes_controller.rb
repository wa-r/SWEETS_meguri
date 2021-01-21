class Member::TweetLikesController < ApplicationController

  def create
    tweet_like = current_member.tweet_likes.new(tweet_id: params[:tweet_id])
    tweet_like.save
    redirect_to request.referer
  end

  def destroy
    tweet_like = TweetLike.find_by(tweet_id: params[:tweet_id], member_id: current_member.id)
    tweet_like.destroy
    redirect_to request.referer
  end

end
