class TeamsController < ApplicationController
  def index
  end

  def show
    @team = Team.includes(:roles).find(params[:id])
  end
end
