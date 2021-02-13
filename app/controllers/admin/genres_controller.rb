class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer, notice: "ジャンルの作成が成功しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンル名を変更しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to request.referer, notice: "ジャンルの削除に成功しました"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
