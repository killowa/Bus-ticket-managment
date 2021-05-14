class StudentsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:add_trip, :save_new_balance]

  def index
    @students = Student.all
    begin
      authorize @students
    rescue Pundit::NotAuthorizedError
      redirect_to root_path, alert: "You don't have access to this page"
    end
  end

  def show
    @student = Student.find(params[:id])
  end
  
  def add_trip

    @student = Student.find(params[:id])
    checked_trips = params[:trip_id].select {|key, value| value == "1"}
    trips_ids = checked_trips.keys 
    @trips = Trip.where(id: trips_ids)

    begin
      @student.trips = @student.trips + @trips 
    rescue 
      flash[:alert] = "You have already booked this trip"
    end
      redirect_to @student
  end

  def update_balance
    @student = current_user
  end

  def save_new_balance

    @student = current_user
    current_user.balance += params[:student][:new_balance].to_d
    current_user.update(balance: current_user.balance)



    redirect_to @student
  end

  def remove_trip
    @student = Student.find(params[:student_id])
    @trip = Trip.find(params[:id])
    @student.trips.destroy(@trip)
    redirect_to @student
  end

  def new
    @student = Student.new
  end

  def create

    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end

  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else 
      render :edit
    end
  end

  def destroy
   @student = Student.find(params[:id])
   @student.destroy

   redirect_to students_path
  end

  def student_params
    params.require(:student).permit(:name, :department, :new_balance)
  end
end
