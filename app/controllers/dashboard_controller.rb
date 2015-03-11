class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user 
      admins = User.where("admin = ?", true)
      current_user.update_attribute :admin, true unless admins.count > 0 
      @workunits = current_user.workunits
      @to_confirm = current_user.workunits_to_confirm
    end
  end

end
