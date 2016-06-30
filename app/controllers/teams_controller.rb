class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_trip

  def create
    @user = current_user
    @team = Team.create({
      user_id: current_user.id,
      trip_id: Trip.find(params[:trip_id]).id,
      })

    respond_to do |format|
      if @team.save

        format.html { redirect_to trip_path(@trip), notice: 'Welcome to this trip!' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def team_params
      params.require(:team).permit(:user_id, :project_id)
    end
end
