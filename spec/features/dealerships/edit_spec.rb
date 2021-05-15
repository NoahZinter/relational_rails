require 'rails_helper'

RSpec.describe 'Dealership edit ' do
  it 'links to the dealership edit page' do
    teds = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)

    visit "/dealerships/#{teds.id}"

    click_link "Update #{teds.name}"

    expect(current_path).to eq("/dealerships/#{teds.id}/edit")
  end

  it 'can edit the dealership' do
    teds = Dealership.create!(name:"Tad's Auto", is_open: true, max_car_capacity: 540, is_full: false)

    visit "/dealerships/#{teds.id}"

    expect(page).to have_content("Tad's Auto")
    click_link "Update #{teds.name}"

    fill_in 'Name', with: "Ted's Auto"
    click_button 'Update Dealership'

    expect(current_path).to eq("/dealerships/#{teds.id}")
    expect(page).to have_content("Ted's")
  end
end
