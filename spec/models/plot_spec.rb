require 'rails_helper'

RSpec.describe Plot do
  before :each do
    @garden = Garden.create!( name:"North Boulder Community Garden",
                                    water_on: false,
                                    water_access_pts: 2
                                  )
    @grove = @garden.plots.create!( name: "The Grove",
                                    available: true,
                                    sun_coverage: :partial_shade,
                                    square_ft: 250
                                  )
    @aaa = @garden.plots.create!( name: "aAA",
                                    available: false,
                                    sun_coverage: :full_sun,
                                    square_ft: 300
                                  )
    @hive = @garden.plots.create!( name: "Hive",
                                    available: false,
                                    sun_coverage: :full_sun,
                                    square_ft: 300
                                  )
  end

  describe 'relationships' do
    it { should belong_to :garden }
  end

  describe 'class methods' do
    describe '#sort_by_name' do
      it 'returns the plots sorted by name alphabetically' do
        expect(Plot.sort_by_name.first).to eq @aaa
        expect(Plot.sort_by_name.last).to eq @grove
      end
    end

    describe '#larger_than' do
      it 'returns plots with area larger than given value' do
        expect(Plot.larger_than(275)).to include @aaa
        expect(Plot.larger_than(275)).to include @hive
        expect(Plot.larger_than(275)).to_not include @grove
      end
    end
  end

  describe 'instance methods' do
    describe '#available_text' do
      it 'returns Yes if plot is available' do
        expect(@grove.available_text).to eq "Yes"
      end

      it 'returns No if plot is not available' do
        expect(@hive.available_text).to eq "No"
      end
    end

    describe '#sun_coverage_text' do
      it 'returns Full Sun for full_sun coverage' do
        expect(@hive.sun_coverage_text).to eq "Full Sun"
      end

      it 'returns Partial Shade for partial_shade coverage' do
        expect(@grove.sun_coverage_text).to eq "Partial Shade"
      end
    end

    describe '#garden_name' do
      it 'returns the name of the garden where plot is located' do
        expect(@grove.garden_name).to eq "North Boulder Community Garden"
      end
    end
  end
end
