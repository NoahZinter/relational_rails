# User Story 19, Parent Delete (x2)

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe 'destroying a dealership' do
  it 'can delete a dealership' do
    harrison = Dealership.create!(name:"Harrison Ford", is_open: true, max_car_capacity: 352, is_full: true)

    visit '/dealerships'
    click_button "Delete #{harrison.name}"

    expect(current_path).to eq('/dealerships')
    expect(page).to_not have_content("Harrison Ford")
  end

  it 'deletes associated employees' do
    harrison = Dealership.create!(name:"Harrison Ford", is_open: true, max_car_capacity: 352, is_full: true)
    harrison.employees.create!(name:"Al E. Gator", cars_sold:74, on_vacation: false)
    harrison.employees.create!(name:"Don Keigh", cars_sold:62, on_vacation: false)
    harrison.employees.create!(name:"Sarha Nader", cars_sold:86, on_vacation: true)

    visit '/dealerships'
    click_button "Delete #{harrison.name}"
    visit '/employees'

    expect(page).to_not have_content("Al E. Gator")
    expect(page).to_not have_content("Don Keigh")
    expect(page).to_not have_content("Sarha Nader")
  end
end