require 'rails_helper'

RSpec.describe 'flowers index page' do
  it 'shows all flowers names' do
    flower1 = Flower.create!(species: "Rose", shelf_life: 5, in_stock: true)
    flower2 = Flower.create!(species: "Aloe Vera", shelf_life: 6, in_stock: true)
    visit "/flowers"


    expect(page).to have_content(flower1.species)
    expect(page).to have_content(flower1.shelf_life)
    expect(page).to have_content(flower1.in_stock)
    expect(page).to have_content(flower2.species)
    expect(page).to have_content(flower2.shelf_life)
    expect(page).to have_content(flower2.in_stock)
  end
end
