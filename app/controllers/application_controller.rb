class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.session_token
  end

  def logout!(user)
    user.reset_session_token
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    if @current_user.nil?
      return false
    end
    session[:session_token] == @current_user.session_token
  end
end
