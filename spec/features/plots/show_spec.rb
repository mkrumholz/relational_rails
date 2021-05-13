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
    @lothlorien    = @south_boulder.plots.create!( name: "Lothlorien",
                                                available: false,
                                                sun_coverage: :partial_sun,
                                                square_ft: 120
                                              )
    @keukenhof     = @tuinpark.plots.create!( name: "Keukenhof",
                                                available: false,
                                                sun_coverage: :full_sun,
                                                square_ft: 400
                                              )
    @kt            = @tuinpark.plots.create!( name: "Kleine Tuinje",
                                                available: true,
                                                sun_coverage: :partial_shade,
                                                square_ft: 88
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

  it 'displays the total plot area'

  it 'displays created at & updated at timestamps'

end
