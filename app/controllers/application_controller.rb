class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    # @current_user ||= User.find_by(id: cookies.permanent.signed[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

  def require_login
    redirect_to login_path if current_user.nil?
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
