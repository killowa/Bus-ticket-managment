class BusesController < ApplicationController

  def index
    @buses = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def show
    @bus = Bus.find(params[:id])
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
  end

  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      redirect_to @bus
    else
      render :new
    end

  end

  private
    def bus_params
      params.require(:bus).permit(:capacity, :trip_id)
    end

end
