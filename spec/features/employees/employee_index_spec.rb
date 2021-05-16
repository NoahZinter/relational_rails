require 'rails_helper'

RSpec.describe "Employee Index" do
  it 'shows an index of all employees' do
    teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    rex = teds.employees.create!(name:"Rex Cars", cars_sold:1, on_vacation: false)
    billy = teds.employees.create!(name:"Billy Maizear", cars_sold:2540, on_vacation: false)

    visit"/employees"

    expect(page).to have_content(rex.name)
    expect(page).to have_content(rex.cars_sold)
    expect(page).to have_content(rex.on_vacation)
    expect(page).to have_content(billy.name)
    expect(page).to have_content(billy.cars_sold)
    expect(page).to have_content(billy.on_vacation)
  end

  it 'only shows employees that are not on vacation (false)' do
    teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    rex = teds.employees.create!(name:"Rex Cars", cars_sold:1, on_vacation: true)
    billy = teds.employees.create!(name:"Billy Maizear", cars_sold:2540, on_vacation: false)

    visit"/employees"
    
    expect(page).not_to have_content(rex.name)
    expect(page).to have_content(billy.name)
  end
end