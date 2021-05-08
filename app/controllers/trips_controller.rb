class TripsController < ApplicationController
  def index
    @bus = Bus.find(params[:bus_id])
    @trips = @bus.trips
  end

  def list_all
    @trips = Trip.all
  end
  
  def new
    @bus = Bus.find(params[:bus_id])
    @trip = Trip.new
  end

  def list
    @student = Student.find(params[:id])
    @trips = Trip.all
  end

  def create
    @bus = Bus.find(params[:bus_id])

    # params[:trip][:starting_time] = params[:trip]["starting_time(4i)"] + ' : ' + params[:trip]["starting_time(5i)"]
   
    # params[:trip][:ending_time][:head] = params[:trip][:ending_time] + ' : ' + params[:trip][:ending_time]
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
    @bus = Bus.find(params[:bus_id])
    @trip = @bus.trips.find(params[:id])
    @trip_buses_count = BusesTrip.where(trip_id: @trip.id).count

    if @trip_buses_count > 1
      @bus.trips.destroy(@trip)
    else
      @bus.trips.destroy(@trip)
      @trip.destroy
    end

    redirect_to bus_trips_path(@bus)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private  

    def trip_params
      params.require(:trip).permit(:price, :source, :destination, :starting_time, :ending_time, :prefix)
    end

end
