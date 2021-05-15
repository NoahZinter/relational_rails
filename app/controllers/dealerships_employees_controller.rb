class DealershipsEmployeesController < ApplicationController
  def index
    dealership = Dealership.find(params[:id])
    @employees = dealership.employees
  end

  def new

  end

  def create
    # require 'pry'; binding.pry
  end
end