class DealershipsController < ApplicationController

  def index
    @dealerships = Dealership.all
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def new

  end

  def create
    dealership = Dealership.create(name: params[:name],
                                   is_open: params[:is_open],
                                   max_car_capacity: params[:max_car_capacity],
                                   is_full: params[:is_full])
    redirect_to "/dealerships"
    # require 'pry'; binding.pry
  end
end
