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
      redirect_to dashboard_path, :notice => "Baustunden eingetragen. Ein Projektleiter muss sie bestätigen bevor sie wirksam werden"
    else 
      redirect_to new_workunit_path(workunit)
    end

  end
  
  def confirm
  
    wu = Workunit.find_by_id(params[:id])
    
    if wu.project.admins.include?(current_user)
      wu.confirmed_by = current_user
      wu.confirmed_at = DateTime.current()
      wu.save
    end
    
    redirect_to dashboard_path, :notice => "Baustunden wurden bestätigt."
    
  end
  
  def deny
    
  end
  
  def workunit_params
    params.require(:workunit).permit(:description, :performed_at, :project_id, :duration)
  end
end
