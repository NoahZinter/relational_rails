class DealershipsEmployeesController < ApplicationController
  def index
    dealership = Dealership.find(params[:id])
    @employees = dealership.employees
  end
end