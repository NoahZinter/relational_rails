require 'rails_helper'

RSpec.describe 'Manufacturer Vehicles Index' do
  it 'shows all of a manufacturers vehicles' do
    manufacturer = Manufacturer.create!(name:"Zonda", production_capacity:40, is_open:true)
    car_1 = manufacturer.vehicles.create!(name:"Speedini", year:1990, price:56000, sold:false)
    car_2 = manufacturer.vehicles.create!(name:"Slowstosa", year:2005, price:24000, sold:false)

    visit "/manufacturers/#{manufacturer.id}/vehicles"

    expect(page).to have_content(car_1.name)
    expect(page).to have_content(car_2.name)
  end

  it 'contains a button to add new vehicle' do
    manufacturer = Manufacturer.create!(name: 'Zonda', production_capacity:40, is_open:true)

    visit "/manufacturers/#{manufacturer.id}/vehicles"

    expect(page).to have_button("Create a New #{manufacturer.name} Vehicle:")
  end
end
