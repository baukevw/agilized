# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = User.find_by_id(current_user.id).teams.joins(:projects).map(&:projects)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @team = Team.new
    @project.teams.build
    @role = Role.new
    @project.teams.first.roles.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      @project.teams.first.user_in_teams.first.update_attributes(user_id: current_user.id, admin: true)
      redirect_to root_path
    else
      @project.errors.messages.each do |c|
        flash[:alert] = c[1].first
      end
      render :new
    end
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

  private

  def project_params
    params.require(:project).permit(:name, :description, teams_attributes: [ :name, roles_attributes: [ :name, :description ]])
  end
end
