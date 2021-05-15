class DealershipsEmployeesController < ApplicationController
  def index
    dealership = Dealership.find(params[:id])
    @employees = dealership.employees
  end

  def new

  end

  def create
    employee = Dealership.find(params[:id]).employees.create(employee_params)
    redirect_to "/dealerships/#{Dealership.find(params[:id]).id}/employees"
  end

  private
  
  def employee_params
    params.permit(
                  :name,
                  :on_vacation,
                  :cars_sold
                 )
  end
end
