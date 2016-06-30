class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]


  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @location = Location.new
    @trip = Trip.find(params[:trip_id])
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @trip = Trip.find(params[:trip_id])
  end

  # GET /locations/new
  def new
    @location = Location.new
    @trip = Trip.find(params[:trip_id])
  end

  # GET /locations/1/edit
  def edit
    @trip = Trip.find(params[:trip_id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
            @trip = Trip.find(params[:trip_id])
            @location.trip_id = @trip.id
            @location.save
        format.html { redirect_to trip_location_path(@trip, @location), notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @location = Location.new(location_params)
    @trip = Trip.find(params[:trip_id])
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to trip_location_path(@trip, @location), notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to trip_locations_path, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:latitude, :longitude, :address, :activity)
    end
end
