require "rails_helper"

RSpec.describe 'Manufacturer New' do
  it 'contains a form for creating new manufacturer' do
    visit 'manufacturers/new'

    expect(page).to have_field('Name')
    expect(page).to have_field('Production capacity')

      within("select#sold") do
        %w(true false).each do |option|
          expect(find("option[value=#{option}]").text).to eq(option)
        end
      end
  end

  it 'creates new manufacturer and navigates to index' do
    visit 'manufacturers/new'

    fill_in('Name', with: 'Peugot')
    fill_in('Production capacity', with: 200)
    select('false')
    click_button('Create Manufacturer')

    expect(current_path).to eq('/manufacturers')
    expect(page).to have_content('Peugot')
  end
end
