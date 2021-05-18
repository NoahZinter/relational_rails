class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.unsold
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.permit(:name, :year, :price, :sold)
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(vehicle_params)
    redirect_to "/vehicles/#{@vehicle.id}"
  end

  def destroy
    vehicle = Vehicle.find(params[:id])
    vehicle.destroy
    redirect_to '/vehicles'
  end
end