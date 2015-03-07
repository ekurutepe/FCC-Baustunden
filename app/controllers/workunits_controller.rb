class WorkunitsController < ApplicationController
before_filter :authenticate_user!

  def index
  end

  def new
    @workunit = Workunit.new()

  end
  
  def create
    project_id = params[:workunit][:project_id]

    project = Project.find_by_id(project_id)
    
    workunit = Workunit.new(workunit_params)
    workunit.performed_by = current_user
    workunit.project = project
    
    if workunit.save
      redirect_to dashboard_path
    else 
      redirect_to new_workunit_path(workunit)
    end

  end
  
  def workunit_params
    params.require(:workunit).permit(:description, :performed_at, :project_id, :duration)
  end
end
