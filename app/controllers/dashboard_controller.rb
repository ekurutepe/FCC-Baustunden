class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user 
      @workunits = current_user.workunits
    end
  end

end
