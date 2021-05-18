require 'rails_helper'


RSpec.describe 'create a flower for a flower shop' do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                          rating: 3,
                                          same_day_delivery: false,
                                          created_at: Time.parse('2021-05-09')
                                        )
  end

  it 'creates a new flower' do
    visit "/flower_shops/#{@mikes_flowers.id}/flowers"

    click_button 'New Flower'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}/flowers/new")

    fill_in 'Species', with: 'Tulip'
    choose :in_stock, option: true
    fill_in 'Shelf Life', with: 0
    click_on 'Create Flower'
    save_and_open_page

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}/flowers")
      expect(page).to have_content('Tulip')
      expect(page).to have_content("In Stock: true")
      expect(page).to have_content("Shelf Life: 0 Days")
  end
end
