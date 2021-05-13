require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to :garden }
  end

  describe 'instance methods' do
    before :each do
      @garden = Garden.create!( name:"North Boulder Community Garden",
                                      water_on: false,
                                      water_access_pts: 2,
                                      created_at: Time.now,
                                      updated_at: Time.now
                                    )
      @plot1 = @garden.plots.create!(  name: "The Grove",
                            available: true,
                            sun_coverage: :full_shade,
                            square_ft: 250
                          )
      @plot2 = @garden.plots.create!(  name: "The Hive",
                            available: false,
                            sun_coverage: :full_sun,
                            square_ft: 300
                          )
    end

    describe '#available_text' do
      it 'returns Yes if plot is available' do
        expect(@plot1.available_text).to eq "Yes"
      end

      it 'returns No if plot is not available' do
        expect(@plot2.available_text).to eq "No"
      end
    end

    # describe '#sun_coverage_text' do
    #
    # end
  end
end
