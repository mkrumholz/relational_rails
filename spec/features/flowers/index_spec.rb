require 'rails_helper'

RSpec.describe 'flowers index page' do
  before :each do
    @flower1 = Flower.create!( species:"Rose",
                                        shelf_life: 3,
                                        in_stock: false
                                      )
    @flower2 = Flower.create!( species:"Sunflower",
                                        shelf_life: 4,
                                        in_stock: true
                                  )
    @flower3 = Flower.create!( species:"Tulip",
                                        shelf_life: 5,
                                        in_stock: true
                                  )
  end
  it 'shows all flowers names' do
    visit "/flowers"


    expect(page).to have_content(@flower1.species)
    expect(page).to have_content("Shelf Life: 3 Days")
    expect(page).to have_content("In Stock: false")
  end

  it 'links to each flowers show page' do
    visit '/flowers'

    click_on 'Rose'

    expect(current_path).to eq("/flowers/#{@flower1.id}")
  end
end
