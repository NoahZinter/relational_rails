class ManufacturerVehiclesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    @vehicles = @manufacturer.vehicles
  end
end