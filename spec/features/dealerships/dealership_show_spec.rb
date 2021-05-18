# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dealership Show' do
  it 'shows only the selected dealership' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    bills = Dealership.create!(name: "Billy's Auto", is_open: false, max_car_capacity: 750, is_full: true)

    visit "/dealerships/#{teds.id}"

    expect(page).to have_content(teds.name)
    expect(page).not_to have_content(bills.name)
  end

  it 'shows selected dealerships attributes' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    bills = Dealership.create!(name: "Billy's Auto", is_open: false, max_car_capacity: 750, is_full: true)

    visit "/dealerships/#{teds.id}"

    expect(page).to have_content(teds.name)
    expect(page).to have_content(teds.max_car_capacity)
    expect(page).to have_content(teds.is_open)
    expect(page).to have_content(teds.is_full)
    expect(page).not_to have_content(bills.name)
  end
end
