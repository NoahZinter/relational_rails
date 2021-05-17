require 'rails_helper'

RSpec.describe "Vehicle Index" do
  it 'displays only the vehicle with the given id' do
    honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open:true)
    civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold:false)
    crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold:true)

   visit "/vehicles/#{civic.id}"

   expect(page).to have_content(civic.name)
   expect(page).to have_content(civic.year)
   expect(page).to have_content(civic.price)
   expect(page).to have_content(civic.sold)
   expect(page).not_to have_content(crv.name)
   expect(page).not_to have_content(crv.year)
   expect(page).not_to have_content(crv.price)
   expect(page).not_to have_content(crv.sold)
  end

  it 'displays a button to edit the vehicle' do
    honda = Manufacturer.create!(name:'Honda', production_capacity: 28, is_open:true)
    civic = honda.vehicles.create!(name:'Civic', year:2000, price:2500, sold:false)

    visit "/vehicles/#{civic.id}"

    expect(page).to have_button('Edit This Civic')
  end

  it 'button nagivates to edit page when clicked' do
    honda = Manufacturer.create!(name:'Honda', production_capacity: 28, is_open:true)
    civic = honda.vehicles.create!(name:'Civic', year:2000, price:2500, sold:false)

    visit "/vehicles/#{civic.id}"
    click_button 'Edit This Civic'

    expect(current_path).to eq("/vehicles/#{civic.id}/edit")
  end

  it 'displays a button to delete the vehicle' do
    honda = Manufacturer.create!(name:'Honda', production_capacity: 28, is_open:true)
    civic = honda.vehicles.create!(name:'Civic', year:2000, price:2500, sold:false)

    visit "/vehicles/#{civic.id}"

    expect(page).to have_button('Delete This Civic')
  end

  it 'button deletes vehicle when clicked' do
    honda = Manufacturer.create!(name:'Honda', production_capacity: 28, is_open:true)
    civic = honda.vehicles.create!(name:'Civic', year:2000, price:2500, sold:false)
    honda.vehicles.create!(name:'CRV', year:2005, price:3000, sold:false)

    visit "/vehicles/#{civic.id}"
    click_button 'Delete This Civic'

    expect(current_path).to eq("/vehicles")
    expect(page).not_to have_content('Civic')
    expect(page).to have_content('CRV')
  end
end