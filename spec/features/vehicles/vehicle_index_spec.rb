require 'rails_helper'

RSpec.describe "Vehicle Index" do
  it 'shows an index of all vehicles' do
    honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open: true)
    civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold: false)
    crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold: false)

   visit"/vehicles"

    expect(page).to have_content(civic.name)
    expect(page).to have_content(civic.year)
    expect(page).to have_content(civic.price)
    expect(page).to have_content(civic.sold)
    expect(page).to have_content(crv.name)
    expect(page).to have_content(crv.year)
    expect(page).to have_content(crv.price)
    expect(page).to have_content(crv.sold)
  end

  it 'only shows vehicles which arent sold' do
    honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open: true)
    civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold: false)
    crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold: true)

    visit '/vehicles'

    expect(page).to have_content(civic.name)
    expect(page).to have_content(civic.year)
    expect(page).to have_content(civic.price)
    expect(page).to have_content(civic.sold)
    expect(page).not_to have_content(crv.name)
    expect(page).not_to have_content(crv.year)
    expect(page).not_to have_content(crv.price)
    expect(page).not_to have_content(crv.sold)
  end

  it 'can handle any order of sold vehicles' do
    honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open: true)
    civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold: true)
    crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold: true)
    accord = honda.vehicles.create!(name:"Accord", year:2000, price:2500, sold: false)
    del_sol = honda.vehicles.create!(name:"Del Sol", year:2005, price:4500, sold: true)

    visit '/vehicles'

    expect(page).not_to have_content(civic.name)
    expect(page).not_to have_content(crv.name)
    expect(page).to have_content(accord.name)
    expect(page).not_to have_content(del_sol.name)
  end

  it 'contains a link to edit each vehicle' do
    honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open: true)
    civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold: false)
    crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold: false)
    accord = honda.vehicles.create!(name:"Accord", year:2000, price:2500, sold: false)
    del_sol = honda.vehicles.create!(name:"Del Sol", year:2005, price:4500, sold: false)

    visit '/vehicles'

    expect(page).to have_button('Edit This Civic')
    expect(page).to have_button('Edit This CRV')
    expect(page).to have_button('Edit This Accord')
    expect(page).to have_button('Edit This Del Sol')
  end
end
