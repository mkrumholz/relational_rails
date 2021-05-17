require 'rails_helper'

RSpec.describe 'flower shop flowers index' do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                        rating: 3,
                                        same_day_delivery: false
                                      )
    @flower1       = @mikes_flowers.flowers.create!( species:"Rose",
                                        shelf_life: 6,
                                        in_stock: false
                                      )
    @flower2       =  @mikes_flowers.flowers.create!( species:"Sunflower",
                                        shelf_life: 4,
                                        in_stock: true
                                      )
    @flower3        =  @mikes_flowers.flowers.create!( species:"Tulip",
                                        shelf_life: 6,
                                        in_stock: true
                                      )
  end

  it 'displays the name of the flower shop' do
    visit "/flower_shops/#{@mikes_flowers.id}/flowers"

    expect(page).to have_content(@mikes_flowers.name)
  end

  it 'links to each flowers show page' do
    visit "/flower_shops/#{@mikes_flowers.id}/flowers"

    click_on "Rose"

    expect(current_path).to eq("/flowers/#{@flower1.id}")
  end

end
