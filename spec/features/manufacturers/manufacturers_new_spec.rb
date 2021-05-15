require "rails_helper"

RSpec.describe 'Manufacturer New' do
  it 'contains a form to create a new manufacturer' do
    visit"/manufacturers/new"

    fill_in('Name', with:'Peugot')
    fill_in('Production capacity', with: 200)
    check('Is open')
    click_button('Create Manufacturer')

    expect(current_path).to eq('/manufacturers')
    expect(page).to have_content('Peugot')
  end
end
