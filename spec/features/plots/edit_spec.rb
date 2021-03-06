require 'rails_helper'

RSpec.describe 'update plot' do
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
  end

  it 'can update the name of a plot' do
    visit "/plots/#{@grove.id}"

    click_button 'Edit'

    expect(current_path).to eq("/plots/#{@grove.id}/edit")

    fill_in 'Name', with: 'The Clover Patch'
    click_button 'Update'

    expect(current_path).to eq("/plots/#{@grove.id}")
    expect(page).to have_content('The Clover Patch')
  end

  it 'can update whether a plot is available' do
    visit "/plots/#{@grove.id}/edit"

    choose :available, option: false
    click_button 'Update'

    expect(current_path).to eq("/plots/#{@grove.id}")
    expect(page).to have_content("The Grove")
    expect(page).to have_content("Currently available? No")
    expect(page).to have_content("Sun coverage: Full Shade")
    expect(page).to have_content("Total area: 250ft\u00B2")
  end

  it 'can update the sun coverage of a plot' do
    visit "/plots/#{@grove.id}/edit"

    select 'Full sun', from: :sun_coverage
    click_button 'Update'

    expect(current_path).to eq("/plots/#{@grove.id}")
    expect(page).to have_content("The Grove")
    expect(page).to have_content("Currently available? Yes")
    expect(page).to have_content("Sun coverage: Full Sun")
    expect(page).to have_content("Total area: 250ft\u00B2")
  end

  it 'can update the square footage of a plot' do
    visit "/plots/#{@grove.id}/edit"

    fill_in :square_ft, with: 400
    click_button 'Update'

    expect(current_path).to eq("/plots/#{@grove.id}")
    expect(page).to have_content("The Grove")
    expect(page).to have_content("Currently available? Yes")
    expect(page).to have_content("Sun coverage: Full Shade")
    expect(page).to have_content("Total area: 400ft\u00B2")
  end
end
