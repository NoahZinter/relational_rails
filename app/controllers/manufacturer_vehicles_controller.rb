class ManufacturerVehiclesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    @vehicles = @manufacturer.vehicles
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.vehicles.create!(vehicle_params)
    redirect_to "/manufacturers/#{@manufacturer.id}/vehicles"
  end

  def vehicle_params
    params.permit(:name, :year, :price, :sold)
  end
end