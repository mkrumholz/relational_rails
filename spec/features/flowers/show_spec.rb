require 'rails_helper'

RSpec.describe 'flowers index page' do
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

  it "displays the flower and its attributes" do
    visit "/flowers/#{@flower1.id}"

    expect(page).to have_content(@flower1.species)
    expect(page).to have_content("Shelf Life: 6 Days")
    expect(page).to have_content("In Stock: false")
  end

  it 'has a button to update flower' do
    visit "/flowers/#{@flower1.id}"

    click_button 'Edit'

    expect(current_path).to eq("/flowers/#{@flower1.id}/edit")
  end
end
