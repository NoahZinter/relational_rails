# frozen_string_literal: true

class DealershipsEmployeesController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @employees = @dealership.employees
    @employees = @dealership.alphabetize if params[:alphabetize]
    if params[:min_cars_sold]
      min = params[:min_cars_sold]
      @employees = @dealership.min_cars_sold(min)
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
