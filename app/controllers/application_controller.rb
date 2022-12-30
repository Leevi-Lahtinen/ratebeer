class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_year

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    return nil if @current_user.nil? || @current_user.deleted_at

    @current_user
  end
end
