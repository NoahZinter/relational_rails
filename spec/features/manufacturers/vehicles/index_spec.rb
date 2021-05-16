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

  it 'contains a button to alphabetize vehicles' do
    manufacturer = Manufacturer.create!(name: 'Zonda', production_capacity:40, is_open:true)

    visit "/manufacturers/#{manufacturer.id}/vehicles"

    expect(page).to have_button("Alphabetize Zonda Vehicles")
  end

  it 'alphabetizes vehicles' do
    honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open: true)
    civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold: false)
    del_sol = honda.vehicles.create!(name:"Del Sol", year:2005, price:4500, sold: false)
    crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold: false)
    accord = honda.vehicles.create!(name:"Accord", year:2000, price:2500, sold: false)

    visit "/manufacturers/#{honda.id}/vehicles"

    expect(del_sol.name).to appear_before(accord.name)
    click_button 'Alphabetize Honda Vehicles'
    expect(accord.name).to appear_before(del_sol.name)
  end
end
