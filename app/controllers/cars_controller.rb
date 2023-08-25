class CarsController < ApplicationController
  # GET /cars
  def index
    @cars = Car.geocoded
    if params[:query].present?
      @results = Car.search(params[:query])
      @cars_ids = @results.pluck(:id)
      @cars = @cars.where(id: @cars_ids)
    end
    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {car: car}),
        marker_html: render_to_string(partial: "marker", locals: {car: car})
      }
    end

  end

  # GET /cars/1
  def show
    @car = Car.find(params[:id])
  end
end
