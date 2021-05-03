class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def create
    @trip = Trip.find_by(destination: params[:ticket][:trip])
    

    @ticket = Ticket.new(price: @trip.price, trip_id: @trip.id)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end

  end

  def new
    @ticket = Ticket.new
  end

  def update


  end

  def destroy
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def edit
  end

  private
    def ticket_params
        params.require(:ticket).permit(:price, :trip)
    end
end
