require "rails_helper"

RSpec.describe 'Manufacturer New' do
  xit 'contains a form to create a new manufacturer' do
    visit"/manufacturers/new"

    expect(page).to
  end
end