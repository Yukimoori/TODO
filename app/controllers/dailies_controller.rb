class DailiesController < ApplicationController
  def index
    @dailies = Daily.all
  end

  def new
    @daily = Daily.new
  end

  def create
    @daily = Daily.new(daily_params)
    if @daily.save
      redirect_to dailies_path, success: '成功しました'
    else
      flash.now[:danger] = "失敗しました"
      render :new
    end
  end

  private
    def daily_params
      params.require(:daily).permit(:date,:cocompany_name,:place,:status,:expection,:comment)
    end

end
