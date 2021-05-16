class ManufacturerVehiclesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    @vehicles = @manufacturer.vehicles
    if params[:alphabetize]
      @vehicles = @manufacturer.alphabetize
    end
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.vehicles.create!(vehicle_params)
    redirect_to "/manufacturers/#{@manufacturer.id}/vehicles"
  end

private
  def vehicle_params
    params.permit(:name, :year, :price, :sold)
  end
end