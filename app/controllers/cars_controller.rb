class CarsController < ApplicationController
  # GET /cars
  def index
    @cars = Car.all.sort_by(&:price_per_day).reverse
  end

  # GET /cars/1
  def show
    @car = Car.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:brand, :model, :price_per_day, :user_id, :photo)
  end
end
