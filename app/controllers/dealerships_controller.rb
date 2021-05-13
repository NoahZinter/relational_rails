class DealershipsController < ApplicationController

  def index
    @dealerships = Dealership.order('created_at DESC').all
  end

  def show
    @dealership = Dealership.find(params[:id])
  end
end
