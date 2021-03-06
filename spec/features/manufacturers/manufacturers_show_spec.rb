# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Manufacturer Show' do
  it 'shows only the selected manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)
    zonda = Manufacturer.create!(name: 'Zonda', production_capacity: 80, is_open: true)

    visit "/manufacturers/#{chevy.id}"

    expect(page).to have_content(chevy.name)
    expect(page).not_to have_content(zonda.name)
  end

  it 'shows selected manufacturers attributes' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)

    visit "/manufacturers/#{chevy.id}"

    expect(page).to have_content(chevy.name)
    expect(page).to have_content(chevy.production_capacity)
    expect(page).to have_content(chevy.is_open)
  end

  it 'counts vehicles of selected manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)
    chevy.vehicles.create!(name: 'Cruz', year: 2000, price: 2500, sold: false)
    chevy.vehicles.create!(name: 'Silverado', year: 2005, price: 4500, sold: true)

    visit "/manufacturers/#{chevy.id}"

    expect(page).to have_content(chevy.vehicle_count)
  end

  it 'includes a link to a list of all vehicles for manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)
    chevy.vehicles.create!(name: 'Cruz', year: 2000, price: 2500, sold: false)
    chevy.vehicles.create!(name: 'Silverado', year: 2005, price: 4500, sold: true)

    visit "/manufacturers/#{chevy.id}"

    expect(page).to have_link('All Chevy Vehicles:', href: "/manufacturers/#{chevy.id}/vehicles")
  end

  it 'includes a link to update the manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)

    visit "/manufacturers/#{chevy.id}"

    expect(page).to have_button('Edit Manufacturer Chevy:')
  end

  it 'navigates to edit page when clicked' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)

    visit "/manufacturers/#{chevy.id}"
    click_button "Edit Manufacturer #{chevy.name}:"

    expect(current_path).to eq("/manufacturers/#{chevy.id}/edit")
  end

  it 'includes a link to delete the manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)

    visit "/manufacturers/#{chevy.id}"

    expect(page).to have_button('Delete Manufacturer Chevy:')
  end

  it 'redirects to index when deleted' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)
    honda = Manufacturer.create!(name: 'Honda', production_capacity: 80, is_open: true)

    visit "/manufacturers/#{chevy.id}"
    click_button 'Delete Manufacturer Chevy'

    expect(current_path).to eq('/manufacturers')
    expect(page).not_to have_content('Chevy')
  end
end
