require 'rails_helper'

RSpec.describe 'New Dealership Child' do
  describe 'Child creation' do
    it 'links to the new page from the dealership/child index' do
      teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)

      visit "/dealerships/#{teds.id}/employees"

      click_link "Create Employee"

      expect(current_path).to eq("/dealerships/#{teds.id}/employees/new")
    end

    it 'can create a new dealership child' do
      teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)

      visit "/dealerships/#{teds.id}/employees/new"

      fill_in('name', with: "Chris P. Bacon")
      within("select#on_vacation") do
        %w(false true).each do |option|
          expect(find("option[value=#{option}]").text).to eq(option)
        end
      end
      fill_in('cars_sold', with: 123)

      click_button 'Create Employee'

      expect(current_path).to eq("/dealerships/#{teds.id}/employees")
      expect(page).to have_content("Chris P. Bacon")
      expect(page).to have_content(false)
      expect(page).to have_content(123)
    end
  end
end
