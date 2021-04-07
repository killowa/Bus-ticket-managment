class TripsController < ApplicationController
  def index
    @trips = Trips.all
  end

  def new
    @trip = Trip.new
  end

  def create
    Trip.create(trip_params)

  end

  def update
  end

  def destroy
  end

  def show
  end

  private  

    def trip_params
      params.require(:trip).permit(:source, :destination, :starting_time, :ending_time)
    end

end
