require 'rails_helper'

RSpec.describe FlowerShop, type: :model do
  describe 'relationships' do
    it { should have_many :flowers }
  end
end
