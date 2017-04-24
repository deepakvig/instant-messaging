class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    user = nil
    if session[:user_session_id]
      user = ActiveUser.find_by(user_session_id: session[:user_session_id]) || ActiveUser.create(user_session_id: session[:user_id], username: session[:username])
    end
    @current_user ||= user if session[:username] && session[:dialect]
  end

  helper_method :current_user
end
