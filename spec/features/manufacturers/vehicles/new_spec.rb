# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Manufacturer Vehicles New' do
  it 'contains a form to create a new vehicle' do
    manufacturer = Manufacturer.create!(name: 'Zonda', production_capacity: 40, is_open: true)
    visit "/manufacturers/#{manufacturer.id}/vehicles/new"

    expect(page).to have_field('Name')
    expect(page).to have_field('Year')
    expect(page).to have_field('Price')
    expect(page).to have_button('Create Vehicle')

    within('select#sold') do
      %w[true false].each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end
  end

  it 'creates a new vehicle' do
    manufacturer = Manufacturer.create!(name: 'Zonda', production_capacity: 40, is_open: true)
    visit "/manufacturers/#{manufacturer.id}/vehicles/new"

    fill_in('Name', with: 'Speedo')
    fill_in('Year', with: 1977)
    fill_in('Price', with: 2000)
    select 'false', from: 'sold'

    click_button 'Create Vehicle'

    expect(current_path).to eq "/manufacturers/#{manufacturer.id}/vehicles"
    expect(page).to have_content('Speedo')
  end
end
