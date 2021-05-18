require 'rails_helper'

RSpec.describe 'create flower shop' do
  it 'creates a new flower shop' do
    visit '/flower_shops'

    click_button 'New Flower Shop'

    expect(current_path).to eq('/flower_shops/new')

    fill_in 'Name', with: 'Mikes Flowers'
    choose :same_day_delivery, option:false
    fill_in 'Rating', with: 4
    
    click_on 'Create Shop'

    expect(current_path).to eq('/flower_shops')
    expect(page).to have_content('Mikes Flowers')
  end
end
