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
