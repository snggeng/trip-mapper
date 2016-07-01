class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_trip
  helper_method :is_user_in_team?

  # def current_trip
  #   @c_trip = Trip.find(params[:id])
  # end

  def is_user_in_team?
    @trip = Trip.find(params[:id])
    @teams = Team.all
    @teams.each do |team|
      if team.trip_id == @trip.id && team.user_id == current_user.id
        return true
      end
    end
    return false
  end
end
