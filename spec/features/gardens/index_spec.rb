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

  it 'shows all of the garden names' do
    visit '/gardens'

    expect(page).to have_content(@north_boulder.name)
    expect(page).to have_content(@south_boulder.name)
    expect(page).to have_content(@tuinpark.name)
  end

  it 'has a link to the home page' do
    visit '/gardens'

    click_on "Home"

    expect(current_path).to eq '/'
  end

  it 'links to each garden show page' do
    visit '/gardens'

    click_on 'North Boulder Community Garden'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}")
  end
end
