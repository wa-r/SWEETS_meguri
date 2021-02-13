class Member::TweetCommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = TweetComment.new(tweet_comment_paramas)
    comment.member_id = current_member.id
    comment.tweet_id = tweet.id
    comment.save
    redirect_to tweet_path(tweet.id)
  end

  def destroy
    TweetComment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
    redirect_to request.referer
  end

  private

  def tweet_comment_paramas
    params.require(:tweet_comment).permit(:comment)
  end
end
