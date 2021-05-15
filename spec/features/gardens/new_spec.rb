# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a POST request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'create garden' do
  it 'creates a new garden' do
    visit '/gardens'

    click_link 'Create new garden'

    expect(current_path).to eq('/gardens/new')

    fill_in 'Name', with: 'New Community Garden'
    fill_in 'Water on?', with: 'No'
    fill_in 'Water access points', with: 3

    expect(current_path).to eq('/gardens')
    expect(page).to have_content('New Community Garden')
  end
end
