# User Story 14, Child Update (x2)

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'Employee edit ' do
  it 'links to the employee edit page' do
    teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    chris = teds.employees.create!(name:"Chris P. Bacon", cars_sold:254, on_vacation: false)

    visit "/employees/#{chris.id}"

    click_link "Update #{chris.name}"

    expect(current_path).to eq("/employees/#{chris.id}/edit")
  end

  it 'can edit the empoloyee' do
    teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    chris = teds.employees.create!(name:"Chris P. acon", cars_sold:254, on_vacation: false)

    visit "/employees/#{chris.id}"

    expect(page).to have_content("Chris P. acon")
    click_link "Update #{chris.name}"

    fill_in 'Name', with: "Chris P. Bacon"
    click_button 'Update Employee'

    expect(current_path).to eq("/employees/#{chris.id}")
    expect(page).to have_content("Chris P. Bacon")
  end
end