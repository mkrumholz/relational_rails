require 'rails_helper'

RSpec.describe "flower shops index page", type: :feature do
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

  it "can see the name of all the flower shops" do
    visit "/flower_shops"

    expect(page).to have_content(@mikes_flowers.name)
    expect(page).to have_content(@floral_designs.name)
    expect(page).to have_content(@flower_depot.name)
  end
end
