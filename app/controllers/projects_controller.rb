class ProjectsController < ApplicationController
before_filter :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new()
  end
  
  def create
    project = Project.new(project_params)
    admin_ids = params[:project][:admin_ids].reject!(&:blank?)
    unless admin_ids.empty?
      admins = admin_ids.map{|x| User.find_by_id(x)}
      project.admins = admins
      project.save
    end
    redirect_to projects_path, :notice => "Created #{project.name}"
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
    admin_ids = params[:project][:admin_ids].reject!(&:blank?)
    unless admin_ids.nil?
      admins = admin_ids.map{|x| User.find_by_id(x)}
      project.admins = admins
      project.save
    end
    redirect_to projects_path, :notice => "Updated #{project.name}"
  end
  
  def project_params
    params.require(:project).permit(:name, admin_ids: [])
  end
  
end
