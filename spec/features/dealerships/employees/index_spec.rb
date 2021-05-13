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
end