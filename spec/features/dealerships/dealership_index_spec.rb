require 'rails_helper'

RSpec.describe do
  it 'shows and index of all dealerships' do
    rex = Dealership.create!(name:"Rex Cars", is_open: false, max_car_capacity: 214, is_full: false)
    harrison = Dealership.create!(name:"Harrison Ford", is_open: true, max_car_capacity: 352, is_full: true)
    ted = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)

    visit '/dealerships'

    expect(page).to have_content(rex.name)
    expect(page).to have_content(harrison.name)
    expect(page).to have_content(ted.name)
  end

  it 'shows the created at date and time for each dealership' do
    rex = Dealership.create!(name:"Rex Cars", is_open: false, max_car_capacity: 214, is_full: false)
    harrison = Dealership.create!(name:"Harrison Ford", is_open: true, max_car_capacity: 352, is_full: true)
    ted = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)

    visit '/dealerships'

    expect(page).to have_content(rex.created_at)
    expect(page).to have_content(harrison.created_at)
    expect(page).to have_content(ted.created_at)
  end

  it 'sorts by created at time' do
    ted = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)
    rex = Dealership.create!(name:"Rex Cars", is_open: false, max_car_capacity: 214, is_full: false)

    visit '/dealerships'

    expect("Rex Cars").to appear_before("Ted's Auto")
  end

  it 'has a link to create a new dealership' do
    ted = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)

    visit '/dealerships'

    expect(page).to have_link('New Dealership')
  end

  it 'navigates to a new page when clicked' do
    ted = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)
    rex = Dealership.create!(name:"Rex Cars", is_open: false, max_car_capacity: 214, is_full: false)

    visit '/dealerships'

    click_link 'New Dealership'

    expect(page).to have_current_path('/dealerships/new')
  end

  it 'has a edit button on each dealership' do
    rex = Dealership.create!(name:"Rex Cars", is_open: false, max_car_capacity: 214, is_full: false)
    harrison = Dealership.create!(name:"Harrison Ford", is_open: true, max_car_capacity: 352, is_full: true)
    ted = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)

    visit '/dealerships'

    expect(page).to have_button("Update #{rex.name}")
    expect(page).to have_button("Update #{harrison.name}")
    expect(page).to have_button("Update #{ted.name}")
  end
end
