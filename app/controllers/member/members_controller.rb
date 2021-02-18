class Member::MembersController < ApplicationController
  # ログイン中のユーザーidと編集したいユーザーidが等しいか判定する。
  before_action :ensure_current_member, { only: [:edit, :update, :withdrawal] }
  def ensure_current_member
    unless current_member.id == params[:id].to_i
      redirect_to member_path(current_member), alert: "権限がありません"
    end
  end

  def show
    @member = Member.find(params[:id])
    @tweets = @member.tweets.page(params[:page]).per(12).order(created_at: "DESC")
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member), notice: "更新に成功しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def withdrawal
    @member = Member.find(params[:id])
    # ゲストユーザは削除できないように設定
    if @member.email == 'guestt@example.com'
      redirect_to root_path, alert: "ゲストユーザーは削除出来ません"
    else
      # is_deletedカラムをtrueに変更することにより削除フラグを立てる
      @member.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
  end

  # ブックマークの一覧表示用
  def bookmarks
    @bookmarks = current_member.bookmarks.page(params[:page]).per(10)
  end

  # いいねをしたつぶやきの一覧表示用
  def tweet_likes
    @member = Member.find(params[:id])
    @tweet_likes = @member.tweet_likes.page(params[:page]).per(9)
  end

  # フォロー画面表示用
  def follows
    member = Member.find(params[:id])
    @members = member.followings.page(params[:page]).per(10)
  end

  # フォロワー画面表示用
  def followers
    member = Member.find(params[:id])
    @members = member.followers.page(params[:page]).per(10)
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image)
  end
end
