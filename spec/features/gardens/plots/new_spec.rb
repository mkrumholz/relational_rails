# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a POST request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'create plot for a specific garden' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 2,
                                    created_at: Time.parse('2021-02-01')
                                  )
  end

  it 'creates a new plot' do
    visit "/gardens/#{@north_boulder.id}/plots"

    click_button 'New plot'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/plots/new")

    fill_in 'Name', with: 'Hippoplotamus'
    choose :available, option: true
    select 'Full sun', from: :sun_coverage
    fill_in 'Total area', with: 350
    click_on 'Create'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/plots")
    within "div#plot-#{@north_boulder.plots.last.id}" do
      expect(page).to have_content('Hippoplotamus')
      expect(page).to have_content("Currently available? Yes")
      expect(page).to have_content("Sun coverage: Full Sun")
      expect(page).to have_content("Total area: 350ft\u00B2")
    end
  end
end
