class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.order('created_at DESC').all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end
