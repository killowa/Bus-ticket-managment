class TripsController < ApplicationController
  def index
    @bus = Bus.find(params[:bus_id])
    @trips = @bus.trips
  end

  def new
    @bus = Bus.find(params[:bus_id])
    @trip = Trip.new
  end

  def create
    @bus = Bus.find(params[:bus_id])
    @trip = @bus.trips.build(trip_params)

    if @trip.save
      @bus.trips << @trip
      redirect_to bus_trips_path(@bus)
    else
      render :new
    end

  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update(trip_params)
      redirect_to @trip
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private  

    def trip_params
      params.require(:trip).permit(:price, :source, :destination, :starting_time, :ending_time)
    end

end
