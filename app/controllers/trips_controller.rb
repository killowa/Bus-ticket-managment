class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)

    if @trip.save
      redirect_to trip
    else
      render :new
    end

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
