require 'rails_helper'

RSpec.describe 'Dealerships Employees index' do
  it 'shows all of the employees for the dealership' do
    dealership = Dealership.create!(name: 'Test Dealership')
    john = dealership.employees.create!(name: "John Smith",
                                        on_vacation: false,
                                        cars_sold: 27)
    sally = dealership.employees.create!(name: "Sally Jones",
                                        on_vacation: true,
                                        cars_sold: 17)

    visit "/dealerships/#{dealership.id}/employees"

    expect(page).to have_content(john.name)
    expect(page).to have_content(sally.name)
  end

  it 'has a button to add a new employee' do
    dealership = Dealership.create!(name: 'Test Dealership')

    visit "/dealerships/#{dealership.id}/employees"

    expect(page).to have_button("Create Employee")
  end

  it 'has a button to add alphabetize employees' do
    dealership = Dealership.create!(name: 'Test Dealership')

    visit "/dealerships/#{dealership.id}/employees"

    expect(page).to have_button("Alphabetize #{dealership.name}'s Employees")
  end

  it 'can alphabetize employees' do
    dealership = Dealership.create!(name: 'Test Dealership')
    sally = dealership.employees.create!(name: "Sally Jones",
                                         on_vacation: true,
                                         cars_sold: 17)
    john = dealership.employees.create!(name: "John Smith",
                                        on_vacation: false,
                                        cars_sold: 27)
    visit "/dealerships/#{dealership.id}/employees"

    expect(sally.name).to appear_before(john.name)
    click_button "Alphabetize Test Dealership's Employees"
    expect(john.name).to appear_before(sally.name)
  end

  it 'has an update button for each employee' do
    dealership = Dealership.create!(name: 'Test Dealership')
    sally = dealership.employees.create!(name: "Sally Jones",
                                         on_vacation: true,
                                         cars_sold: 17)
    john = dealership.employees.create!(name: "John Smith",
                                        on_vacation: false,
                                        cars_sold: 27)
    visit "/dealerships/#{dealership.id}/employees"

    expect(page).to have_button("Update #{john.name}")
    expect(page).to have_button("Update #{sally.name}")
  end

  it 'redirects to and employee update page' do
    dealership = Dealership.create!(name: 'Test Dealership')
    sally = dealership.employees.create!(name: "Sally Jones",
                                         on_vacation: true,
                                         cars_sold: 17)
    john = dealership.employees.create!(name: "John Smith",
                                        on_vacation: false,
                                        cars_sold: 27)
    visit "/dealerships/#{dealership.id}/employees"

    click_button "Update #{john.name}"

    expect(page).to have_current_path("/employees/#{john.id}/edit")
  end
end
