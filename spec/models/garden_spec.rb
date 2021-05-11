require 'rails_helper'

RSpec.describe Garden do
  describe 'instance methods' do
    it 'exists' do
      garden = Garden.new()

      expect(garden).is_a? Garden
    end
  end
end
