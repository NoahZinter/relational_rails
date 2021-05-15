require 'rails_helper'

RSpec.describe "Manufacturer Index" do
  it 'shows an index of all manufacturers' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
   zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)

   visit"/manufacturers"

   expect(page).to have_content(chevy.name)
   expect(page).to have_content(zonda.name)
  end

  it 'shows the created at time for each manufacturer' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
   zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)

   visit"/manufacturers"

   expect(page).to have_content(chevy.created_at)
   expect(page).to have_content(zonda.created_at)
  end

  it 'orders manufacturers by time created' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
   zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
   ford = Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

   visit"/manufacturers"

   expect(page.text.index(chevy.name)).to be > page.text.index(zonda.name)
   expect(page.text.index(zonda.name)).to be > page.text.index(ford.name)
  end

  it 'contains a link to create a manufacturer' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
   zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
   ford = Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

   visit"/manufacturers"

   expect(page).to have_link("Create Manufacturer:", :href => "/manufacturers/new")
  end

  it 'contains a link to create a manufacturer' do
   chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
   zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
   ford = Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

   visit"/manufacturers"
   click_link('Create Manufacturer:')

   expect(page).to have_current_path('/manufacturers/new')
  end
end