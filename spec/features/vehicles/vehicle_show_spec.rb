require 'rails_helper'

RSpec.describe "Vehicle Index" do
  it 'shows an index of all vehicles' do
    honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open:true)
    civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold:false)
    crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold:true)

   visit"/vehicles/#{civic.id}"

   expect(page).to have_content(civic.name)
   expect(page).to have_content(civic.year)
   expect(page).to have_content(civic.price)
   expect(page).to have_content(civic.sold)
   expect(page).not_to have_content(crv.name)
   expect(page).not_to have_content(crv.year)
   expect(page).not_to have_content(crv.price)
   expect(page).not_to have_content(crv.sold)
  end
end