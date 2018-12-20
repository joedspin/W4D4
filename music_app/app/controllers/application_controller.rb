class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  private
  def require_no_user!
    redirect_to_cats_url if current_url
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
    user.save!
    current_user
  end
end
