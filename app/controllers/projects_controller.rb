class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def show 
    @project = Project.find(params[:id])
  end
  
  def update
    project = Project.find(params[:id])
    project.update!(project_params)
    admin_ids = params[:admin_ids]
    unless admin_ids.nil?
      admins = User.find_all_by_id(admin_id)
      project.admins = admins
      project.save
    end
    redirect_to projects_path
  end
  
  def project_params
    params.require(:project).permit(:name, admin_ids: [])
  end
  
end
