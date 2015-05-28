class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :verify_login

  def verify_login
      @user = User.find_by(id: session[:user_id])
  end
end
