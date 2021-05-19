require 'rails_helper'

RSpec.describe "flower shops show page", type: :feature do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                        rating: 3,
                                        same_day_delivery: false
                                      )
    @floral_designs = FlowerShop.create!( name:"Floral Designs",
                                        rating: 4,
                                        same_day_delivery: true
                                  )
    @flower_depot = FlowerShop.create!( name:"Flower Depot",
                                        rating: 5,
                                        same_day_delivery: true
                                  )
    @flower1     = @mikes_flowers.flowers.create!( species:"Rose",
                                        shelf_life: 6,
                                        in_stock: false
                                      )
    @flower2     =  @mikes_flowers.flowers.create!( species:"Sunflower",
                                        shelf_life: 4,
                                        in_stock: true
                                      )
  end

  it "displays the flower shop and its attributes" do
    visit "/flower_shops/#{@mikes_flowers.id}"

    expect(page).to have_content(@mikes_flowers.name)
    expect(page).to have_content("Shop Rating: 3")
    expect(page).to have_content("Same Day Delivery: false")
  end

  it 'shows the total number of flowers in a flower shop' do
    visit "/flower_shops/#{@mikes_flowers.id}"

    expect(page).to have_content("Total Flowers: 2")
  end

  it 'has button to edit flower shop' do
    visit "/flower_shops/#{@mikes_flowers.id}"

    click_button 'Update Shop'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}/edit")
  end

  it 'can delete a flower shop' do
    visit "/flower_shops/#{@mikes_flowers.id}"

    click_button 'Delete Shop'

    expect(current_path).to eq("/flower_shops")
    expect(page).to_not have_content("Mikes Flower Shop")
  end

  it 'has a button to see all flowers' do
    visit "/flower_shops/#{@mikes_flowers.id}"

    click_button 'See all Flowers'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}/flowers")
  end
end
