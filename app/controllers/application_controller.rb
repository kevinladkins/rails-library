class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize_user
    unless !!current_user.librarian?
      flash.alert = "You are not authorized to do that."
      redirect_to root_path
    end
  end

  helper_method :current_user
end
