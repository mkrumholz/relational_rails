require 'rails_helper'

RSpec.describe Flower, type: :model do
  describe 'relationships' do
    it { should belong_to :flower_shop }
  end
end
