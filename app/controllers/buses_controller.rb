class BusesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :save_trip

  def index
    @buses = Bus.all

    begin
      authorize @buses
    rescue Pundit::NotAuthorizedError
      redirect_to root_path, alert: "You don't have access to this page"
    end
  end

  def new
    @bus = Bus.new
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def add_trip
    @trips = Trip.select("id, destination")
  end

  def save_trip
    @trip = Trip.find(params[:trip_id])
    @bus = Bus.find(params[:id])

    @bus.trips << @trip

    redirect_to @bus
  end

  def update
    @bus = Bus.find(params[:id])

    if @bus.update(bus_params)
      redirect_to @bus
    else
      render :edit
    end  

  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def destroy
    @bus = Bus.find(params[:id])
    @bus.destroy

    redirect_to buses_path

  end

  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      redirect_to @bus
    else
      render :new
    end

  end

  def available
    @bus = Bus.find(params[:id])
    @trips = Trip.all
  end

  private
    def bus_params
      params.require(:bus).permit(:capacity)
    end

end
