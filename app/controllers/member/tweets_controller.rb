class Member::TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.member_id = current_member.id
    @tweet.save
    redirect_to tweets_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :content, :image)
  end
end
