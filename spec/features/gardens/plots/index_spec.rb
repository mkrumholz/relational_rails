# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with
# that Parent with each Child's attributes:

require 'rails_helper'

RSpec.describe 'garden plots index' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                      water_on: false,
                                      water_access_pts: 2
                                    )
    @grove         = @north_boulder.plots.create!( name: "The Grove",
                                                available: true,
                                                sun_coverage: :full_shade,
                                                square_ft: 250
                                              )
    @hive          =  @north_boulder.plots.create!( name: "The Hive",
                                                available: false,
                                                sun_coverage: :partial_shade,
                                                square_ft: 100
                                              )
  end

  it 'displays all plot names for a garden' do
    visit "/gardens/#{@north_boulder.id}/plots"

    expect(page).to have_content(@grove.name)
    expect(page).to have_content(@hive.name)
  end

  it 'links to each plots show page' do
    visit "/gardens/#{@north_boulder.id}/plots"

    click_on "The Grove"

    expect(current_path).to eq("/plots/#{@grove.id}")
  end

  it 'displays plot availability when yes' do
    visit "/gardens/#{@north_boulder.id}/plots"

    within "div#plot-#{@grove.id}" do
      expect(page).to have_content("Currently available? Yes")
    end
  end

  it 'displays plot availability when no' do
    visit "/gardens/#{@north_boulder.id}/plots"

    within "div#plot-#{@hive.id}" do
      expect(page).to have_content("Currently available? No")
    end
  end

  it 'displays plot sun coverage' do
    visit "/gardens/#{@north_boulder.id}/plots"

    within "div#plot-#{@grove.id}" do
      expect(page).to have_content("Sun coverage: Full Shade")
    end

    within "div#plot-#{@hive.id}" do
      expect(page).to have_content("Sun coverage: Partial Shade")
    end
  end

  it 'displays plot area' do
    visit "/gardens/#{@north_boulder.id}/plots"

    within "div#plot-#{@grove.id}" do
      expect(page).to have_content("Total area: 250ft\u00B2")
    end

    within "div#plot-#{@hive.id}" do
      expect(page).to have_content("Total area: 100ft\u00B2")
    end
  end
end
