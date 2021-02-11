class Member::ReviewsController < ApplicationController

  # ログイン中のユーザーidと編集したいユーザーidが等しいか判定する。
  before_action :ensure_current_member, {only: [:edit]}
  def ensure_current_member
    unless current_member.id == params[:member_id].to_i
      redirect_to member_path(current_member), alert: "権限がありません"
    end
  end

  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = @shop.reviews.page(params[:page]).per(10).order(id: "DESC")
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = current_member.reviews.new(review_params)
    @review.shop_id = @shop.id
    review_count = Review.where(shop_id: params[:shop_id]).where(member_id: current_member.id).count
    # バリデーションによるエラーがあるか判定
    if @review.valid?
      # バリデーションエラーが無い、且つレビューを一度もしたことない場合
      if review_count < 1
        @review.save
        redirect_to shop_reviews_path(@shop), notice: "レビューを保存しました"
      else
        redirect_to shop_reviews_path(@shop), notice: "レビューの投稿は一度までです"
      end
    else
      flash.now[:alert] = "レビューの保存に失敗しました"
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @review = Review.find_by(id: params[:id], shop_id: params[:shop_id])
  end

  def update
    @review = Review.find_by(id: params[:id], shop_id: params[:shop_id])
    @review.member_id = current_member.id
    if @review.update(review_params)
      redirect_to shop_reviews_path(shop_id: params[:shop_id]), notice: "レビューを更新しました"
    else
      flash.now[:alert] = "レビューの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id], shop_id: params[:shop_id])
    @review.destroy
    redirect_to request.referer, notice: "レビューを削除しました"

  end

  private
  def review_params
    params.require(:review).permit(:title, :content, :rate)
  end

end
