require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many :plots }
  end

  describe 'instance methods' do
    before :each do
      @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                water_on: false,
                                water_access_pts: 2,
                                created_at: Time.now,
                                updated_at: Time.now
                              )
      @south_boulder = Garden.create!( name:"South Boulder Community Garden",
                                water_on: true,
                                water_access_pts: 2,
                                created_at: Time.now,
                                updated_at: Time.now
                              )
      @hive = @north_boulder.plots.create!( name: "The Hive",
                                            available: false,
                                            sun_coverage: :full_sun,
                                            square_ft: 300
                                          )
      @grove = @north_boulder.plots.create!(  name: "The Grove",
                                              available: true,
                                              sun_coverage: :partial_shade,
                                              square_ft: 250
                                            )
    end

    describe '#water_on_text' do
      it 'returns Yes if water is on' do
        expect(@south_boulder.water_on_text).to eq "Yes"
      end

      it 'returns No if water is not on' do
        expect(@north_boulder.water_on_text).to eq "No"
      end
    end

    describe 'plot_count' do
      it 'returns the number of plots for the garden' do
        expect(@north_boulder.plot_count).to eq 2
      end
    end

    describe 'plots_by_name' do
      it 'returns the plots sorted by name in alphabetical order' do
        expect(@north_boulder.plots.first).to eq @hive
        expect(@north_boulder.plots_by_name.first).to eq @grove
      end
    end
  end
end
