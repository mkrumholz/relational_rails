require 'rails_helper'

RSpec.describe 'create garden' do
  it 'creates a new garden' do
    visit '/gardens'

    click_button 'New garden'

    expect(current_path).to eq('/gardens/new')

    fill_in 'Name', with: 'New Community Garden'
    choose :water_on, option:false
    fill_in 'Water access points', with: 3
    click_on 'Create'

    expect(current_path).to eq('/gardens')
    expect(page).to have_content('New Community Garden')
  end
end
