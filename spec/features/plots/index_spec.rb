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

  it 'shows all of the plot names' do
    visit '/plots'

    expect(page).to have_content(@grove.name)
    expect(page).to have_content(@hive.name)
    expect(page).to have_content(@lothlorien.name)
    expect(page).to have_content(@keukenhof.name)
    expect(page).to have_content(@kt.name)
  end

  it 'links to the plot show page' do
    visit '/plots'

    click_on 'The Grove'

    expect(current_path).to eq("/plots/#{@grove.id}")
  end

  it 'displays plot availability when yes' do
    visit '/plots'

    within "div#plot-#{@grove.id}" do
      expect(page).to have_content("Currently available? Yes")
    end
  end

  it 'displays plot availability when no' do
    visit '/plots'

    within "div#plot-#{@lothlorien.id}" do
      expect(page).to have_content("Currently available? No")
    end
  end

  it 'displays plot sun coverage' do
    visit '/plots'

    within "div#plot-#{@grove.id}" do
      expect(page).to have_content("Sun coverage: Full Shade")
    end
  end

  it 'displays plot area' do
    visit '/plots'

    within "div#plot-#{@grove.id}" do
      expect(page).to have_content("Total area: 250ft\u00B2")
    end
  end
end
