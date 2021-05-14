# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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
    # save_and_open_page
    # fill_in('is open', with: "true")
    # fill_in('max car capacity', with: "754")
    # fill_in('is full', with: "false")
    click_on('Create Dealership')
    expect(current_path).to eq('/dealerships')
    save_and_open_page
    expect(page).to have_content("Bob's Auto")
  end
end
