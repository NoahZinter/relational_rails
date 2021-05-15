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
    Manufacturer.create(name: params[:name], production_capacity: params[:production_capacity], is_open: params[:is_open])
    redirect_to '/manufacturers'
  end

  def edit
  end
end
