class DashboardController < ApplicationController
  before_action :logged_in_user
  layout false
  
  def index
  end
end
