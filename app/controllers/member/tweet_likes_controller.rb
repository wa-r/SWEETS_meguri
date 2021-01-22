class Member::TweetLikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    tweet_like = current_member.tweet_likes.new(tweet_id: @tweet.id)
    tweet_like.save
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    tweet_like = current_member.tweet_likes.find_by(tweet_id: @tweet.id)
    tweet_like.destroy
  end

end
