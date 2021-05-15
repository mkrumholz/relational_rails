require 'rails_helper'

RSpec.describe 'gardens index' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 2,
                                    created_at: Time.parse('2021-02-01')
                                  )
    @south_boulder = Garden.create!( name:"South Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 3,
                                    created_at: Time.parse('2021-04-01')
                                  )
    @tuinpark = Garden.create!( name:"Tuinpark Ons Buiten",
                                    water_on: true,
                                    water_access_pts: 4,
                                    created_at: Time.parse('2021-01-01')
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

  it 'has a link to create a new garden' do
    visit '/gardens'

    click_link 'Create new garden'

    expect(current_path).to eq('/gardens/new')
  end
end
