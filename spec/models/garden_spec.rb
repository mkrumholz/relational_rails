require 'rails_helper'

RSpec.describe Garden do
  before :each do
    @south_boulder = Garden.create!( name:"South Boulder Community Garden",
                              water_on: true,
                              water_access_pts: 2,
                              created_at: Time.now,
                              updated_at: Time.now
                            )
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                              water_on: false,
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
    @aaa = @north_boulder.plots.create!( name: "aAA",
                                    available: false,
                                    sun_coverage: :full_sun,
                                    square_ft: 300
                                  )
  end

  describe 'relationships' do
    it { should have_many(:plots).dependent(:destroy) }
  end

  describe 'instance methods' do
    describe '#water_on_text' do
      it 'returns Yes if water is on' do
        expect(@south_boulder.water_on_text).to eq "Yes"
      end

      it 'returns No if water is not on' do
        expect(@north_boulder.water_on_text).to eq "No"
      end
    end

    describe '#plot_count' do
      it 'returns the number of plots for the garden' do
        expect(@north_boulder.plot_count).to eq 3
      end
    end

    describe '#plots_by_name' do
      it 'returns the plots sorted by name in alphabetical order' do
        expect(@north_boulder.plots.first).to eq @hive
        expect(@north_boulder.plots_by_name.first).to eq @aaa
      end
    end

    describe '#sort_order' do
      it 'sets the sort order by name for the garden plots when params dictate' do
        params = {sort: 'by_name'}
        expect(@north_boulder.sort_order(params).first).to eq @aaa
      end

      it 'leaves the sort order as-is for the garden plots when no sort params' do
        params = {}
        expect(@north_boulder.sort_order(params).first).to eq @hive
      end
    end

    describe '#min_square_ft' do
      it 'returns only plots from sorted_plots with sq ft larger than provided value' do
        params = {sort: 'by_name', square_ft: 275}
        expect(@north_boulder.min_square_ft(params).first).to eq @aaa
      end
    end
  end

  describe 'class methods' do
    describe '#sort_by_plot_count' do
      it 'returns the plots sorted by plot count desc' do
        expect(Garden.by_plot_count).to eq [@north_boulder, @south_boulder]
      end
    end
  end
end
