require 'rails_helper'

RSpec.describe 'plot index' do
  before :each do

    @tuinpark = Garden.create!( name:"Tuinpark Ons Buiten",
                                water_on: true,
                                water_access_pts: 4,
                                created_at: Time.parse('2021-01-01')
                              )
    @south_boulder = Garden.create!(  name:"South Boulder Community Garden",
                                      water_on: false,
                                      water_access_pts: 3,
                                      created_at: Time.parse('2021-04-01')
                                    )
    @north_boulder = Garden.create!(  name:"North Boulder Community Garden",
                                      water_on: false,
                                      water_access_pts: 2,
                                      created_at: Time.parse('2021-02-01')
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
    @kt            = @tuinpark.plots.create!( name: "Kleine Tuinje",
                                              available: true,
                                              sun_coverage: :partial_shade,
                                              square_ft: 88
                                            )
    @lothlorien    = @south_boulder.plots.create!( name: "Lothlorien",
                                              available: false,
                                              sun_coverage: :partial_sun,
                                              square_ft: 120
                                            )

  end

  it 'shows all of the garden names in order of date created' do
    visit '/gardens'

    expect(page).to have_content(@north_boulder.name)
    expect(page).to have_content(@south_boulder.name)
    expect(page).to have_content(@tuinpark.name)
    expect(@south_boulder.name).to appear_before(@north_boulder.name)
    expect(@north_boulder.name).to appear_before(@tuinpark.name)
  end

  it 'links to each garden show page' do
    visit '/gardens'

    click_on 'North Boulder Community Garden'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}")
  end

  it 'has buttons to edit each garden' do
    visit '/gardens'

    within "div#garden-#{@north_boulder.id}" do
      click_button 'Edit'
    end

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/edit")
  end

  it 'has a button to create a new garden' do
    visit '/gardens'

    click_button 'New garden'

    expect(current_path).to eq('/gardens/new')
  end

  it 'has a button to delete each garden' do
    visit '/gardens'

    within "div#garden-#{@north_boulder.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eq("/gardens")
    expect(page).to_not have_content('North Boulder Community Garden')
  end

  it 'has a button to sort parents by the number of plots (desc)' do
    visit '/gardens'

    expect(@south_boulder.name).to appear_before(@north_boulder.name)
    expect(@north_boulder.name).to appear_before(@tuinpark.name)

    click_button 'Sort by # of plots'

    expect(@north_boulder.name).to appear_before(@south_boulder.name)
    expect(@south_boulder.name).to appear_before(@tuinpark.name)
  end
end
