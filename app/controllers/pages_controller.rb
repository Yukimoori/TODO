class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_index_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params)
    redirect_to pages_path
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title,:note,:op_start,:op_expection,:op_finished,:priority,:status)
    end

end
