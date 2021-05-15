require 'rails_helper'

RSpec.describe "Manufacturer Vehicles New" do
  it 'contains a form to create a new vehicle' do
    manufacturer = Manufacturer.create!(name:"Zonda", production_capacity:40, is_open:true)
    visit "/manufacturers/#{manufacturer.id}/vehicles/new"

    expect(page).to have_field("Name")
    expect(page).to have_field("Year")
    expect(page).to have_field("Price")
    expect(page).to have_unchecked_field("Has it been sold yet")
    expect(page).to have_button("Create Vehicle")
  end
end