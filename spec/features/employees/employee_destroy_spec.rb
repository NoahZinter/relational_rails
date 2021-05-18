# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'destroying an employee' do
  it 'can delete an employee' do
    teds = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 540, is_full: false)
    chris = teds.employees.create!(name: 'Chris P. Bacon', cars_sold: 254, on_vacation: false)
    howie = teds.employees.create!(name: 'Howie Doohan', cars_sold: 27, on_vacation: false)

    visit "/employees/#{chris.id}"
    click_button "Delete #{chris.name}"

    expect(current_path).to eq('/employees')
    expect(page).to_not have_content('Chris P. Bacon')
    expect(page).to have_content('Howie Doohan')
  end
end
