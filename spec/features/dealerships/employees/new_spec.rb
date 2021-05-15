# User Story 13, Parent Child Creation (x2)

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'New Dealership Child' do
  describe 'Child creation' do
    it 'links to the new page from the dealership/child index' do
      teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)

      visit "/dealerships/#{teds.id}/employees"
      # save_and_open_page
      click_link "Create Employee"

      expect(current_path).to eq("/dealerships/#{teds.id}/employees/new")
    end

    it 'can create a new dealership child' do
      teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)

      visit "/dealerships/#{teds.id}/employees/new"

      fill_in('name', with: "Chris P. Bacon")
      click_button 'Create Employee'

      expect(current_path).to eq("/dealerships/#{teds.id}/employees")
      expect(page).to have_content("Chris P. Bacon")
    end
  end
end
