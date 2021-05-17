# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

require 'rails_helper'

RSpec.describe 'gardens index' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 2
                                  )
    @south_boulder = Garden.create!( name:"South Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 3
                                  )
    @tuinpark      = Garden.create!( name:"Tuinpark Ons Buiten",
                                    water_on: true,
                                    water_access_pts: 4
                                  )
    @grove         = @north_boulder.plots.create!( name: "The Grove",
                                                available: true,
                                                sun_coverage: :full_shade,
                                                square_ft: 250
                                              )
    @hive          =  @north_boulder.plots.create!( name: "The Hive",
                                                available: true,
                                                sun_coverage: :partial_shade,
                                                square_ft: 100
                                              )
  end

  it 'displays the garden name' do
    visit "/gardens/#{@north_boulder.id}"

    expect(page).to have_content("North Boulder Community Garden")
  end

  it 'says Yes if water is on' do
    visit "/gardens/#{@tuinpark.id}"

    expect(page).to have_content("Water on for the season? Yes")
  end

  it 'says No if water is not on' do
    visit "/gardens/#{@north_boulder.id}"

    expect(page).to have_content("Water on for the season? No")
  end

  it 'displays num of water access points' do
    visit "/gardens/#{@north_boulder.id}"

    expect(page).to have_content("Water access points available: 2")
  end

  it 'displays created at & updated at timestamps' do
    new_garden = Garden.create!(name:"South Boulder Community Garden",
                                water_on: false,
                                water_access_pts: 3,
                                created_at: Time.parse("2021-01-01"),
                                updated_at: Time.parse("2021-02-01")
                              )

    visit "/gardens/#{new_garden.id}"

    expect(page).to have_content("Garden added: 2021-01-01")
    expect(page).to have_content("Last update: 2021-02-01")
  end

  it 'has a button to see all garden plots for garden' do
    visit "/gardens/#{@north_boulder.id}"

    click_button 'See all plots'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/plots")
  end

  it 'shows the total number of plots in the garden' do
    visit "/gardens/#{@north_boulder.id}"

    expect(page).to have_content("Total plots: 2")
  end
end
