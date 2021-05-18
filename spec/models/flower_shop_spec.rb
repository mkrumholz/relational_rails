require 'rails_helper'

RSpec.describe FlowerShop, type: :model do
  describe 'relationships' do
    it { should have_many :flowers }
  end

  describe 'instance methods' do
    before :each do
      @mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                          rating: 3,
                                          same_day_delivery: false,
                                          created_at: Time.now,
                                          updated_at: Time.now
                                        )
      @floral_designs = FlowerShop.create!( name:"Floral Designs",
                                          rating: 4,
                                          same_day_delivery: true,
                                          created_at: Time.now,
                                          updated_at: Time.now
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

    describe 'flower_count' do
      it 'returns the number of flowers in a flower shop' do
        expect(@mikes_flowers.flower_count).to eq 2
      end
    end
  end
end
