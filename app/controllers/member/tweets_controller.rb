class Member::TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.page(params[:page]).per(12)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweet_comment = TweetComment.new
    @member = @tweet.member
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.member_id = current_member.id
    if @tweet.save
      redirect_to member_path(current_member), notice: "つぶやきを投稿しました"
    else
      flash.now[:alert] = "つぶやき投稿失敗しました"
      render :new
    end
  end

  # def edit
  #   @tweet = Tweet.find(params[:id])
  # end

  # def update
  #   @tweet = Tweet.find(params[:id])
  #   @tweet.update(tweet_params)
  #   redirect_to tweets_path
  # end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweet_path(@tweet)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :image)
  end

end
