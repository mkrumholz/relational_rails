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

    @flower3      =  @floral_designs.flowers.create!( species:"Tulip",
                                      shelf_life: 3,
                                      in_stock: true
                                    )
    @flower4      = @flower_depot.flowers.create!( species:"Carnation",
                                      shelf_life: 7,
                                      in_stock: true
                                    )
    @flower5      = @flower_depot.flowers.create!( species:"Petunia",
                                      shelf_life: 5,
                                      in_stock: true
                                    )
  end
  it 'shows all flowers names' do
    visit "/flowers"

    expect(page).to have_content(@flower1.species)
    # expect(page).to have_content("Shelf Life: 3 Days")
    # expect(page).to have_content("In Stock: false")
  end

  it 'links to each flowers show page' do
    visit '/flowers'

    click_on 'Rose'

    expect(current_path).to eq("/flowers/#{@flower1.id}")
  end
end
