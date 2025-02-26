class DashboardController < ApplicationController
  before_action :logged_in_user
  layout 'application'    
  def index
  end
end
