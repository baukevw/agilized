# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = User.find(current_user.id).projects.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      @project.user_projects.create( :user_id => current_user.id )
      redirect_to projects_path
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
