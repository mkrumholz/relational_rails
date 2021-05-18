require 'rails_helper'

RSpec.describe 'garden plots index' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                      water_on: false,
                                      water_access_pts: 2
                                    )
    @hive          =  @north_boulder.plots.create!( name: "The Hive",
                                                available: false,
                                                sun_coverage: :partial_shade,
                                                square_ft: 100
                                              )
    @grove         = @north_boulder.plots.create!( name: "The Grove",
                                                available: true,
                                                sun_coverage: :full_shade,
                                                square_ft: 250
                                              )
  end

  it 'displays the name of the garden' do
    visit "/gardens/#{@north_boulder.id}/plots"

    expect(page).to have_content(@north_boulder.name)
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

  it 'has a button to create a new plot' do
    visit "/gardens/#{@north_boulder.id}/plots"

    click_button 'New plot'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/plots/new")
  end

  it 'has buttons to edit each plot' do
    visit "/gardens/#{@north_boulder.id}/plots"

    within "div#plot-#{@hive.id}" do
      click_button 'Edit'
    end

    expect(current_path).to eq("/plots/#{@hive.id}/edit")
  end

  it 'has a button to sort the plots in alphabetical order by name' do
    visit "/gardens/#{@north_boulder.id}/plots"

    expect(@hive.name).to appear_before(@grove.name)

    click_button 'Sort by name'

    expect(@grove.name).to appear_before(@hive.name)
  end

  it 'has a button to only show plots larger than sepcified square feet' do
    visit "/gardens/#{@north_boulder.id}/plots"

    expect(page).to have_content('The Hive')

    fill_in "Show only plots with minimum plot area:", with: 200
    click_on "Update view by area"

    expect(page).to_not have_content('The Hive')
  end
end
