class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = Car.find(params[:car_id])
    if @booking.save
      redirect_to car_path(@booking.car), notice: "Booking was successfully created.", status: :see_other
    else
      @car = Car.find(params[:car_id])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id)
  end
end
