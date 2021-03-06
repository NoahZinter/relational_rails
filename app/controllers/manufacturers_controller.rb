# frozen_string_literal: true

class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new; end

  def create
    Manufacturer.create(manufacturer_params)
    redirect_to '/manufacturers'
  end

  def manufacturer_params
    params.permit(:name, :production_capacity, :is_open)
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
    @name = @manufacturer.name
    @production_capacity = @manufacturer.production_capacity
    @is_open = @manufacturer.is_open
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.update(manufacturer_params)
    redirect_to "/manufacturers/#{@manufacturer.id}"
  end

  def destroy
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.destroy
    redirect_to '/manufacturers'
  end
end
