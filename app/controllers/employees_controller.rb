class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.where(on_vacation: false)
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    employee = Employee.find(params[:id])
    employee.update(employee_params)
    redirect_to "/employees/#{employee.id}"
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    redirect_to '/employees'
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
