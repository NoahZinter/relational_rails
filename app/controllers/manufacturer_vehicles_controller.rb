class ManufacturerVehiclesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    @vehicles = @manufacturer.vehicles
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end
end