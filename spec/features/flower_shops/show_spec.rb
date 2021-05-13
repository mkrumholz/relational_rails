require 'rails_helper'

RSpec.describe "flower shops show page", type: :feature do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower shop",
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
  end

  it "displays the flower shop and its attributes" do
    visit "/flower_shops/#{@mikes_flowers.id}"

    expect(page).to have_content(@mikes_flowers.name)
    expect(page).to have_content("Shop Rating: 3")
    expect(page).to have_content("Same Day Delivery: false")
  end
end
