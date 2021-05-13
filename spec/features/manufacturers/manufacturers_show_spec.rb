require 'rails_helper'

RSpec.describe "Manufacturer Show" do
  it 'shows only the selected manufacturer' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
   zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)

   visit"/manufacturers/#{chevy.id}"

   expect(page).to have_content(chevy.name)
   expect(page).not_to have_content(zonda.name)
  end

  it 'shows selected manufacturers attributes' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)

   visit"/manufacturers/#{chevy.id}"

   expect(page).to have_content(chevy.name)
   expect(page).to have_content(chevy.production_capacity)
   expect(page).to have_content(chevy.is_open)
  end
end