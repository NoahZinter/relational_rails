class DealershipsEmployeesController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @employees = @dealership.employees
    if params[:alphabetize]
      @employees = @dealership.alphabetize
    end
  end

  def new
    @dealership = Dealership.find(params[:id])
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
