class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
  end

  def create
    Manufacturer.create(manufacturer_params)
    redirect_to '/manufacturers'
  end

  def manufacturer_params
    params.permit(:name, :production_capacity, :is_open)
  end

  def edit
  end
end
