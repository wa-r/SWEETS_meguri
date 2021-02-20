class Member::TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.page(params[:page]).per(12).order(created_at: "DESC")
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
      tags = Vision.get_image_data(@tweet.image)
      tags.each do |tag|
        @tweet.tags.create(name: tag)
      end
      redirect_to member_path(current_member), notice: "つぶやきを投稿しました"
    else
      flash.now[:alert] = "つぶやき投稿失敗しました"
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.member_id = current_member.id
    @tweet.destroy!
    redirect_to member_path(current_member)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :image)
  end
end
