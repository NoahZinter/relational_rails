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

    visit"/manufacturers"

    expect(page).to have_link("Create Manufacturer:", :href => "/manufacturers/new")
  end

  it 'navigates to page when link is clicked' do
    chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)

    visit"/manufacturers"
    click_link('Create Manufacturer:')

    expect(page).to have_current_path('/manufacturers/new')
  end

  it 'contains a link next to each manufacturer to edit' do
    chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
    zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
    ford = Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

    visit"/manufacturers"

    expect(page).to have_button('Edit Manufacturer Chevy')
    expect(page).to have_button('Edit Manufacturer Zonda')
    expect(page).to have_button('Edit Manufacturer Ford')
  end

  it 'contains a link next to each manufacturer to delete' do
    Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
    Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
    Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

    visit "/manufacturers"

    expect(page).to have_button('Delete Manufacturer Chevy')
    expect(page).to have_button('Delete Manufacturer Zonda')
    expect(page).to have_button('Delete Manufacturer Ford')
  end

  it 'clicking delete deletes manufacturer' do
    Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
    Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
    Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

    visit "/manufacturers"
    click_button('Delete Manufacturer Chevy')

    expect(page).not_to have_content('Chevy')
    expect(page).to have_content('Zonda')
    expect(page).to have_content('Ford')
  end

  it 'clicking delete deletes manufacturer vehicles' do
    chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
    chevy.vehicles.create!(name:'Scooper', year:1990, price:1900, sold: false)
    chevy.vehicles.create!(name:'S 10', year:1995, price:1700, sold: false)
    Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
    Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

    visit "/manufacturers"
    click_button('Delete Manufacturer Chevy')

    expect(page).not_to have_content('Chevy')
    expect(page).to have_content('Zonda')
    expect(page).to have_content('Ford')
  end
end
