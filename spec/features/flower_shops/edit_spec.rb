require 'rails_helper'

RSpec.describe 'update Flower shop' do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                        rating: 3,
                                        same_day_delivery: false,
                                        created_at: Time.parse('2021-05-09')
                                      )
  end

  it 'can update just the name of the flower shop' do
    visit "/flower_shops/#{@mikes_flowers.id}"

    click_button 'Update'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}/edit")

    fill_in 'Name', with: 'Flowers From Gary'
    click_on 'Update'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}")
    expect(page).to have_content('Flowers From Gary')
  end

  it 'can update same day delivery to true' do
    visit "/flower_shops/#{@mikes_flowers.id}/edit"

    choose :same_day_delivery, option: true
    click_button 'Update'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}")
    expect(page).to have_content('Mikes Flower Shop')
    expect(page).to have_content('Same Day Delivery: true')
  end

  it 'can update the shop rating' do
    visit "/flower_shops/#{@mikes_flowers.id}/edit"

    fill_in "Rating", with: 5
    click_button 'Update'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}")
    expect(page).to have_content('Mikes Flower Shop')
    expect(page).to have_content('Shop Rating: 5')
  end
end
