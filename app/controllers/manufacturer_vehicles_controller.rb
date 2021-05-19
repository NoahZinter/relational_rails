# frozen_string_literal: true

class ManufacturerVehiclesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    @vehicles = @manufacturer.vehicles
    @vehicles = @manufacturer.alphabetize if params[:alphabetize]
    if params[:find_cars_under_price]
      @vehicles = @manufacturer.under_price(params[:find_cars_under_price])
    end
    if params[:find_cars_over_price]
      @vehicles = @manufacturer.over_price(params[:find_cars_over_price])
    end
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.vehicles.create!(vehicle_params)
    redirect_to "/manufacturers/#{manufacturer.id}/vehicles"
  end

  private

  def vehicle_params
    params.permit(:name, :year, :price, :sold)
  end
end
