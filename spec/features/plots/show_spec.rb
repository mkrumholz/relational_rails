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
    @keukenhof     = @tuinpark.plots.create!( name: "Keukenhof",
                                                available: false,
                                                sun_coverage: :full_sun,
                                                square_ft: 400
                                              )
  end

  it 'displays the plot name' do
    visit "/plots/#{@grove.id}"

    expect(page).to have_content("The Grove")
  end

  it 'displays Yes if the plot is available' do
    visit "/plots/#{@grove.id}"

    expect(page).to have_content("Currently available? Yes")
  end

  it 'displays No if the plot is not available' do
    visit "/plots/#{@keukenhof.id}"

    expect(page).to have_content("Currently available? No")
  end

  it 'displays the sun coverage' do
    visit "/plots/#{@grove.id}"

    expect(page).to have_content("Sun coverage: Full Shade")
  end

  it 'displays the total plot area' do
    visit "/plots/#{@grove.id}"

    expect(page).to have_content("Total area: 250ft\u00B2")
  end

  it 'displays created at & updated at timestamps' do
    new_plot = @tuinpark.plots.create!( name: "Kleine Tuinje",
                                        available: true,
                                        sun_coverage: :partial_shade,
                                        square_ft: 88,
                                        created_at: Time.parse("2021-01-01"),
                                        updated_at: Time.parse("2021-02-01")
                                      )
    visit "/plots/#{new_plot.id}"

    expect(page).to have_content("Plot added: 2021-01-01 07:00:00 UTC")
    expect(page).to have_content("Last update: 2021-02-01 07:00:00 UTC")
  end

  it 'has a button to edit the plot' do
    visit "/plots/#{@grove.id}"

    click_button 'Edit'

    expect(current_path).to eq("/plots/#{@grove.id}/edit")
  end
end
