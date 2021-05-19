# frozen_string_literal: true

class DealershipsEmployeesController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @employees = @dealership.employees
    @employees = @dealership.alphabetize if params[:alphabetize]
    if params[:min_cars_sold]
      @employees = @dealership.min_cars_sold(params[:min_cars_sold])
    end
  end

  def new
    @dealership = Dealership.find(params[:id])
  end

  def create
    @dealership = Dealership.find(params[:id])
    employee = Dealership.find(params[:id]).employees.create(employee_params)
    redirect_to "/dealerships/#{@dealership.id}/employees"
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
