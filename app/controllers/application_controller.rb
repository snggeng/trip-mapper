class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_trip

  def current_trip
    @c_trip = Trip.find(params[:id])
  end
end
