require 'rails_helper'

RSpec.describe "Manufacturer Index" do
  it 'shows an index of all manufacturers' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
   zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)

   visit"/manufacturers"

   expect(page).to have_content(chevy.name)
   expect(page).to have_content(zonda.name)
  end
end