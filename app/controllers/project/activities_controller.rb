class Project::ActivitiesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @activity = Project.find(params[:project_id]).activities.all
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def new
    @project = Project.find(params[:id])
    @activity = Activity.new
  end

  def update
    @project = Project.find(params[:id])
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      @activity.save
      redirect_to project_activities_path(@project)
    else
      render :edit
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:yesterday, :today, :problems, :date)
  end

end
