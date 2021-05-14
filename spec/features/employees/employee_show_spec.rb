require 'rails_helper'

RSpec.describe "Employee Show" do
  it 'shows the attributes of an employee' do
    teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    rex = teds.employees.create!(name:"Rex Cars", cars_sold:1, on_vacation: true)
    billy = teds.employees.create!(name:"Billy Maizear", cars_sold:2540, on_vacation: false)

    visit"/employees/#{rex.id}"

    expect(page).to have_content(rex.name)
    expect(page).to have_content(rex.cars_sold)
    expect(page).to have_content(rex.on_vacation)
    expect(page).not_to have_content(billy.name)
    expect(page).not_to have_content(billy.cars_sold)
    expect(page).not_to have_content(billy.on_vacation)
  end
end