class Member::TweetLikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    tweet_like = current_member.tweet_likes.new(tweet_id: tweet.id)
    tweet_like.save
    # redirect_to request.referer
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    tweet_like = current_member.tweet_likes.find_by(tweet_id: tweet.id)
    tweet_like.destroy
    # redirect_to request.referer
  end

end
