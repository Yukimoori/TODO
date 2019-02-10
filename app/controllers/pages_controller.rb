class PagesController < ApplicationController
  def new
    # @detail = Detail.new
  end

  def create
    @detail = current_user.detail.new(detail_params)

    if @detail.save
      redirect_to pages_new_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
    def detail_params
      params.require(:detail)
      # .permit(:image, :description)
    end
end
