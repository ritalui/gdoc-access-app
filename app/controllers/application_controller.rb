class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # make it a helper method, so it can be accessed in the view
  helper_method :current_user

end
