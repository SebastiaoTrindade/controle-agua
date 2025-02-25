class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :logged_in_user, except: [:new, :create]
  
  private

  def logged_in_user
    unless logged_in?     
    flash[:danger] = "Por favor, faca login."
    redirect_to login_url unless request.path == login_url
    end
  end

end
