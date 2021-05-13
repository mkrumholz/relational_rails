require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to :garden }
  end

  describe 'instance methods' do
    describe '#available_text' do
      it 'returns Yes if plot is available' do
        garden = Garden.create!( name:"North Boulder Community Garden",
                                        water_on: false,
                                        water_access_pts: 2,
                                        created_at: Time.now,
                                        updated_at: Time.now
                                      )
        plot = garden.plots.create!(  name: "The Grove",
                              available: true,
                              sun_coverage: :full_shade,
                              square_ft: 250
                            )

      expect(plot.available_text).to eq "Yes"
      end

      it 'returns No if plot is not available' do
        garden = Garden.create!( name:"North Boulder Community Garden",
                                        water_on: false,
                                        water_access_pts: 2,
                                        created_at: Time.now,
                                        updated_at: Time.now
                                      )
        plot = garden.plots.create!(  name: "The Grove",
                              available: false,
                              sun_coverage: :full_shade,
                              square_ft: 250
                            )
        expect(plot.available_text).to eq "No"
      end
    end
  end
end
