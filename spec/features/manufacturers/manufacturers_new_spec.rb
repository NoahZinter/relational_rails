require "rails_helper"

RSpec.describe 'Manufacturer New' do
  it 'contains a form to create a new manufacturer' do
    visit"/manufacturers/new"

    fill_in('Name', with:'Peugot')
    fill_in('Production Capacity', with: 200)
    fill_in('Is Open', with: true)
    click_button('Create Manufacturer')

    expect(current_path).to eq('/manufacturers/index')
    expect(page).to have_content('Peugot')
  end
end
