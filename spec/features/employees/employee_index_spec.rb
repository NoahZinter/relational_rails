# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employee Index' do
  it 'shows an index of all employees' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    rex = teds.employees.create!(name: 'Rex Cars', cars_sold: 1, on_vacation: false)
    billy = teds.employees.create!(name: 'Billy Maizear', cars_sold: 2540, on_vacation: false)

    visit '/employees'

    expect(page).to have_content(rex.name)
    expect(page).to have_content(rex.cars_sold)
    expect(page).to have_content(rex.on_vacation)
    expect(page).to have_content(billy.name)
    expect(page).to have_content(billy.cars_sold)
    expect(page).to have_content(billy.on_vacation)
  end

  it 'only shows employees that are not on vacation (false)' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    rex = teds.employees.create!(name: 'Rex Cars', cars_sold: 1, on_vacation: true)
    billy = teds.employees.create!(name: 'Billy Maizear', cars_sold: 2540, on_vacation: false)

    visit '/employees'

    expect(page).not_to have_content(rex.name)
    expect(page).to have_content(billy.name)
  end

  it 'has an update button for each employee' do
    dealership = Dealership.create!(name: 'Test Dealership')
    sally = dealership.employees.create!(name: 'Sally Jones',
                                         on_vacation: false,
                                         cars_sold: 17)
    john = dealership.employees.create!(name: 'John Smith',
                                        on_vacation: false,
                                        cars_sold: 27)
    visit '/employees'

    expect(page).to have_button("Update #{john.name}")
    expect(page).to have_button("Update #{sally.name}")
  end

  it 'redirects to and employee update page' do
    dealership = Dealership.create!(name: 'Test Dealership')
    sally = dealership.employees.create!(name: 'Sally Jones',
                                         on_vacation: true,
                                         cars_sold: 17)
    john = dealership.employees.create!(name: 'John Smith',
                                        on_vacation: false,
                                        cars_sold: 27)
    visit '/employees'

    click_button "Update #{john.name}"

    expect(page).to have_current_path("/employees/#{john.id}/edit")
  end

  it 'can delete an employee' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    chris = teds.employees.create!(name: 'Chris P. Bacon', cars_sold: 254, on_vacation: false)
    howie = teds.employees.create!(name: 'Howie Doohan', cars_sold: 27, on_vacation: false)

    visit '/employees'
    click_button "Delete #{chris.name}"

    expect(current_path).to eq('/employees')
    expect(page).to_not have_content('Chris P. Bacon')
    expect(page).to have_content('Howie Doohan')
  end
end
