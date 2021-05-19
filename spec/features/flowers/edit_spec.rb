require 'rails_helper'

RSpec.describe 'update flowers' do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                        rating: 3,
                                        same_day_delivery: false
                                      )
    @flower1     = @mikes_flowers.flowers.create!( species:"Rose",
                                        shelf_life: 6,
                                        in_stock: true
                                      )
  end

  it 'can update the species of a flower' do
    visit "/flowers/#{@flower1.id}"

    click_button 'Edit'

    expect(current_path).to eq("/flowers/#{@flower1.id}/edit")

    fill_in 'Species', with: 'Tulip'
    click_button 'Update'

    expect(current_path).to eq("/flowers/#{@flower1.id}")
    expect(page).to have_content('Tulip')
  end

  it 'can update if a flower is in stock' do
    visit "/flowers/#{@flower1.id}/edit"

    choose :in_stock, option: true
    click_button 'Update'

    expect(current_path).to eq("/flowers/#{@flower1.id}")
    expect(page).to have_content("Rose")
    expect(page).to have_content("In Stock: true")
    expect(page).to have_content("Shelf Life: 6")
  end

  it 'can update the shelf life' do
    visit "/flowers/#{@flower1.id}/edit"

    fill_in :shelf_life, with: 0
    click_button 'Update'

    expect(current_path).to eq("/flowers/#{@flower1.id}")
    expect(page).to have_content("Rose")
    expect(page).to have_content("In Stock: false")
    expect(page).to have_content("Shelf Life: 0")
  end
end
