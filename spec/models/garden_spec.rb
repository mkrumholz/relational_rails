require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many :plots }
  end

  describe 'instance methods' do
    describe '#water_on_text' do
      it 'returns Yes if water is on' do
        garden = Garden.create!( name:"North Boulder Community Garden",
                                        water_on: true,
                                        water_access_pts: 2,
                                        created_at: Time.now,
                                        updated_at: Time.now
                                      )
        expect(garden.water_on_text).to eq "Yes"
      end

      it 'returns No if water is not on' do
        garden = Garden.create!( name:"North Boulder Community Garden",
                                        water_on: false,
                                        water_access_pts: 2,
                                        created_at: Time.now,
                                        updated_at: Time.now
                                      )
        expect(garden.water_on_text).to eq "No"
      end
    end
  end
end
