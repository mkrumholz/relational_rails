require 'rails_helper'

RSpec.describe FlowerShop, type: :model do
  describe 'new' do
    it '::create' do
      flower_shop = FlowerShop.new()

      expect(flower_shop).is_a? FlowerShop
    end
  end
end
