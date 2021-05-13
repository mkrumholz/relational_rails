require 'rails_helper'

RSpec.describe "flower shops show page", type: :feature do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower shop",
                                        rating: 3,
                                        same_day_delivery: false,
                                      )
    @floral_designs = FlowerShop.create!( name:"Floral Designs",
                                        rating: 4,
                                        same_day_delivery: true,
                                  )
    @flower_depot = FlowerShop.create!( name:"Flower Depot",
                                        rating: 5,
                                        same_day_delivery: true,
                                  )
  end

  it "displays the flower shop and its attributes" do
    visit "/flower_shops/#{@mikes_flowers.id}"
    save_and_open_page

    expect(page).to have_content(@mikes_flowers.name)
    expect(page).to have_content(@mikes_flowers.rating)
    expect(page).to have_content(@mikes_flowers.same_day_delivery)
  end
end
