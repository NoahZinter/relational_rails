require 'rails_helper'

RSpec.describe do
  it 'contains a form to edit the vehicle' do
    honda = Manufacturer.create!(name:'Honda', production_capacity: 28, is_open:true)
    civic = honda.vehicles.create!(name:'Civic', year:2000, price:2500, sold:false)

    visit "/vehicles/#{civic.id}/edit"

    expect(page).to have_field('Name')
    expect(page).to have_field('Year')
    expect(page).to have_field('Price')

    within("select#sold") do
        %w(true false).each do |option|
          expect(find("option[value=#{option}]").text).to eq(option)
        end
      end
  end
end