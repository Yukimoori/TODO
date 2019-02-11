class PagesController < ApplicationController
  def new
    @page = page.new
  end

  def create
    @page = current_user.page.new(page_params)

    if @page.save
      redirect_to pages_new_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def create
    @page = Page.new(page_params)
    @page.user_id = current_user.id
    if @page.save
    end
  end
end
