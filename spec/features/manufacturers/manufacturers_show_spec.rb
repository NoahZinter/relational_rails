require 'rails_helper'

RSpec.describe "Manufacturer Show" do
  it 'shows only the selected manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity:40, is_open:true)
    zonda = Manufacturer.create!(name:'Zonda', production_capacity:80, is_open:true)

    visit"/manufacturers/#{chevy.id}"

    expect(page).to have_content(chevy.name)
    expect(page).not_to have_content(zonda.name)
  end

  it 'shows selected manufacturers attributes' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity:40, is_open:true)

    visit"/manufacturers/#{chevy.id}"

    expect(page).to have_content(chevy.name)
    expect(page).to have_content(chevy.production_capacity)
    expect(page).to have_content(chevy.is_open)
  end

  it 'counts vehicles of selected manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity:40, is_open:true)
    chevy.vehicles.create!(name:'Cruz', year:2000, price:2500, sold:false)
    chevy.vehicles.create!(name:"Silverado", year:2005, price:4500, sold:true)

    visit "/manufacturers/#{chevy.id}"

    expect(page).to have_content(chevy.vehicle_count)
  end

  it 'includes a link to a list of all vehicles for manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)
    chevy.vehicles.create!(name:'Cruz', year:2000, price:2500, sold: false)
    chevy.vehicles.create!(name: 'Silverado', year: 2005, price: 4500, sold: true)

    visit"/manufacturers/#{chevy.id}"

    expect(page).to have_link("All Chevy Vehicles:", :href => "/manufacturers/#{chevy.id}/vehicles")
  end

  it 'includes a link to update the manufacturer' do
    chevy = Manufacturer.create!(name: 'Chevy', production_capacity: 40, is_open: true)

    visit"/manufacturers/#{chevy.id}"

    expect(page).to have_link('Update This Manufacturer:', :href => "/manufacturers/#{chevy.id}/edit")
  end
end
