# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a PATCH request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'update garden' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 2,
                                    created_at: Time.parse('2021-02-01')
                                  )
  end

  it 'can update just the name of the garden' do
    visit "/gardens/#{@north_boulder.id}"

    click_button 'Edit'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/edit")

    fill_in 'Name', with: 'Arborwood Community Garden'
    click_on 'Update'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}")
    expect(page).to have_content('Arborwood Community Garden')
  end

  it 'can update just one attribute of the garden' do
    visit "/gardens/#{@north_boulder.id}"

    click_button 'Edit'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/edit")

    choose :water_on, option: true
    click_on 'Update'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}")
    expect(page).to have_content('North Boulder Community Garden')
    expect(page).to have_content('Water on? Yes')
    expect(page).to have_content('Water access points: 2')
  end
end
