class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars
  def index
    @cars = Car.all
  end

  # GET /cars/1
  def show
    @car = Car.new
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /carqs/1/edit
  def edit
  end

  # POST /cars
  def create
    @car = Car.new(car_param)

    if @garden.save
      redirect_to @car, notice: "Garden was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      redirect_to @car, notice: "Car was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /car/1
  def destroy
    @car.destroy
    redirect_to car_url, notice: "Car was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_param
      params.require(:car).permit(:brand, :model, :price_per_day, :user_id)
    end

end
