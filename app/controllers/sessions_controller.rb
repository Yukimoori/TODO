class SessionsController < ApplicationController
  def new
    if logged_in?
    redirect_to tasks_index_path, success: 'ログインに成功しました'
    else
      @user = User.new()
    end
  end

  def create
    user = User.find_by(email:params[:session][:email])
    if user&& user.authenticate(params[:session][:password])
       log_in user
       redirect_to tasks_index_path, success: 'ログインに成功しました'
     else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
  end

  private
  def log_in(user)
    session[:user_id]=user.id
  end
end
