require 'rails_helper'

RSpec.describe "Manufacturer Edit" do
  it 'displays a form for editing manufacturer' do
    zonda = Manufacturer.create!(name:'Zonda', production_capacity: 80, is_open: true)

    visit "/manufacturers/#{zonda.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("Production capacity")
    expect(page).to have_field("Is open")
  end

  it 'updates the selected manufacturer' do
    zonda = Manufacturer.create!(name:'Zonda', production_capacity: 80, is_open: true)

    visit "/manufacturers/#{zonda.id}/edit"

    fill_in('Name', with: 'Terry')
    fill_in('Production capacity', with: 89)
    check('Is open')
    click_button('Edit Manufacturer')

    expect(current_path).to eq("/manufacturers/#{zonda.id}")
    expect(page).to have_content('Terry')
  end
end
