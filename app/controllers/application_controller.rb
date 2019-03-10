class ApplicationController < ActionController::Base
  # before_filter :set_locale

  def set_locale
    I18n.locale = "ja" || I18n.default_locale
  end

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
