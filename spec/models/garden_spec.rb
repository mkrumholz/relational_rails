require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many :plots }
  end

  describe 'instance methods' do
    before :each do
      @grove = Garden.create!( name:"North Boulder Community Garden",
                                water_on: false,
                                water_access_pts: 2,
                                created_at: Time.now,
                                updated_at: Time.now
                              )
      @hive = Garden.create!( name:"North Boulder Community Garden",
                                water_on: true,
                                water_access_pts: 2,
                                created_at: Time.now,
                                updated_at: Time.now
                              )
      @plot1 = @grove.plots.create!( name: "The Grove",
                                      available: true,
                                      sun_coverage: :partial_shade,
                                      square_ft: 250
                                    )
      @plot2 = @grove.plots.create!( name: "The Hive",
                                      available: false,
                                      sun_coverage: :full_sun,
                                      square_ft: 300
                                    )
    end

    describe '#water_on_text' do
      it 'returns Yes if water is on' do
        expect(@hive.water_on_text).to eq "Yes"
      end

      it 'returns No if water is not on' do
        expect(@grove.water_on_text).to eq "No"
      end
    end

    describe 'plot_count' do
      it 'returns the number of plots for the garden' do
        expect(@grove.plot_count).to eq 2
      end
    end
  end
end
