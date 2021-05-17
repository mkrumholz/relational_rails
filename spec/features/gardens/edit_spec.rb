require 'rails_helper'

RSpec.describe 'update garden' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 2,
                                    created_at: Time.parse('2021-02-01')
                                  )
  end

  it 'can update just the name of the garden' do
    visit "/gardens/#{@north_boulder.id}"

    click_button 'Edit'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}/edit")

    fill_in 'Name', with: 'Arborwood Community Garden'
    click_on 'Update'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}")
    expect(page).to have_content('Arborwood Community Garden')
  end

  it 'can update whether the water is on' do
    visit "/gardens/#{@north_boulder.id}/edit"

    choose :water_on, option: true
    click_on 'Update'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}")
    expect(page).to have_content('North Boulder Community Garden')
    expect(page).to have_content('Water on for the season? Yes')
    expect(page).to have_content('Water access points available: 2')
  end

  it 'can update whether the water is on' do
    visit "/gardens/#{@north_boulder.id}/edit"

    fill_in 'Water access points', with: 4
    click_on 'Update'

    expect(current_path).to eq("/gardens/#{@north_boulder.id}")
    expect(page).to have_content('North Boulder Community Garden')
    expect(page).to have_content('Water on for the season? No')
    expect(page).to have_content('Water access points available: 4')
  end
end
