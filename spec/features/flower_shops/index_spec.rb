require 'rails_helper'

RSpec.describe "flower shops index page", type: :feature do
  before :each do
    @mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                        rating: 3,
                                        same_day_delivery: false,
                                        created_at: Time.parse('2021-05-09')
                                      )
    @floral_designs = FlowerShop.create!( name:"Floral Designs",
                                        rating: 4,
                                        same_day_delivery: true,
                                        created_at: Time.parse('2021-05-10')
                                  )
    @flower_depot = FlowerShop.create!( name:"Flower Depot",
                                        rating: 5,
                                        same_day_delivery: true,
                                        created_at: Time.parse('2021-05-08')
                                  )
  end

  it "can see the name of all the flower shops in order of date created" do
    visit "/flower_shops"

    expect(page).to have_content(@mikes_flowers.name)
    expect(page).to have_content(@floral_designs.name)
    expect(page).to have_content(@flower_depot.name)
    expect(@floral_designs.name).to appear_before(@mikes_flowers.name)
    expect(@mikes_flowers.name).to appear_before(@flower_depot.name)
  end

  it 'links to each flower shops show page' do
    visit '/flower_shops'

    click_on 'Mikes Flower Shop'

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}")
  end

  it 'displays created at timestamps' do

    visit visit "/flower_shops"

    expect(page).to have_content("Established: 2021-05-09")
  end

  it 'has a button to create a new flower shop' do
    visit '/flower_shops'

    click_button 'New Flower Shop'

    expect(current_path).to eq('/flower_shops/new')
  end

  it 'has buttons to edit each flower shop' do
    visit '/flower_shops'

    within "div#flower_shop-#{@mikes_flowers.id}" do
      click_button 'Edit'
    end

    expect(current_path).to eq("/flower_shops/#{@mikes_flowers.id}/edit")
  end
end
