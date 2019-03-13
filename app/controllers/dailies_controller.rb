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

  def destroy
    @daily = Daily.find(params[:id])
    @daily.destroy
    redirect_to dailies_path
  end

  private
    def daily_params
      params.require(:daily).permit(:date,:companyName,:place,:status,:expectation,:comment)
    end

end
