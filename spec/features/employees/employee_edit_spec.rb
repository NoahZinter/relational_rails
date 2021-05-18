# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employee edit ' do
  it 'links to the employee edit page' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    chris = teds.employees.create!(name: 'Chris P. Bacon', cars_sold: 254, on_vacation: false)

    visit "/employees/#{chris.id}"

    click_button "Update #{chris.name}"

    expect(current_path).to eq("/employees/#{chris.id}/edit")
  end

  it 'can edit the empoloyee' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    chris = teds.employees.create!(name: 'Chris P. acon', cars_sold: 254, on_vacation: false)

    visit "/employees/#{chris.id}"

    expect(page).to have_content('Chris P. acon')
    click_button "Update #{chris.name}"

    fill_in 'Name', with: 'Chris P. Bacon'
    within('select#on_vacation') do
      %w[true false].each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end
    fill_in('cars_sold', with: 123)
    click_button 'Update Employee'

    expect(current_path).to eq("/employees/#{chris.id}")
    expect(page).to have_content('Chris P. Bacon')
    expect(page).to have_content(true)
    expect(page).to have_content(123)
  end
end
