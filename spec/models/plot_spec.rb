require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to :garden }
  end

  describe 'instance methods' do
    it 'exists' do
      plot = Plot.new()

      expect(plot).is_a? Plot
    end
  end
end
