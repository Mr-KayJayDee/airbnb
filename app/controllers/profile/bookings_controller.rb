module Profile
  class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

    def index
      @rented_bookings = current_user.rented_bookings
      @bookings = Booking.where(user: current_user)
    end

    def show
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
        redirect_to car_path(@booking.car), notice: "Your booking was successfully saved.", status: :see_other
      else
        render :new
      end
    end

    def update
      booking = Booking.find(params[:id])
      case params[:state]
      when "Accept"
        booking.update(state: 'accepted')
        redirect_to profile_bookings_path, notice: "Your booking was successfully approved.", status: :see_other
      when "Decline"
        booking.update(state: 'declined')
        redirect_to profile_bookings_path, notice: "Your booking was successfully declined.", status: :see_other
      when "Cancel"
        booking.update(state: 'cancelled')
        redirect_to profile_bookings_path, notice: "Your booking was successfully cancelled.", status: :see_other
      when "Complete"
        booking.update(state: 'completed')
        redirect_to profile_bookings_path, notice: "Your booking was successfully completed.", status: :see_other
      when "Review"
        booking.update(rating: params[:booking][:rating].to_i, state: 'reviewed')
        redirect_to profile_bookings_path, notice: "Your booking was successfully reviewed.", status: :see_other
      end
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id, :state, :rating)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
end
