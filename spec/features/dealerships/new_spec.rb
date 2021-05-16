require 'rails_helper'

RSpec.describe 'New Dealership' do
  describe 'Dealership creation' do
    it 'links to the new page from the dealerships index' do
      visit '/dealerships'

      click_link("New Dealership")
      expect(current_path).to eq(('/dealerships/new'))
    end
  end

  it 'can create a new dealership' do
    visit '/dealerships/new'

    fill_in('name', with: "Bob's Auto")
    within("select#is_open") do
      %w(true false).each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end
    fill_in('max_car_capacity', with: 654)
    within("select#is_full") do
      %w(true false).each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end

    click_on('Create Dealership')

    expect(current_path).to eq('/dealerships')
    expect(page).to have_content("Bob's Auto")
  end
end
