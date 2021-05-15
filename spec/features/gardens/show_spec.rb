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
    @tuinpark = Garden.create!( name:"Tuinpark Ons Buiten",
                                    water_on: true,
                                    water_access_pts: 4
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

    expect(page).to have_content("Garden added: 2021-01-01 07:00:00 UTC")
    expect(page).to have_content("Last update: 2021-02-01 07:00:00 UTC")
  end
end
