# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a PATCH request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'update plot' do
  before :each do
    @north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                      water_on: false,
                                      water_access_pts: 2
                                    )
    @grove         = @north_boulder.plots.create!( name: "The Grove",
                                                available: true,
                                                sun_coverage: :full_shade,
                                                square_ft: 250
                                              )
  end
  it 'can update the name of a plot' do
    visit "/plots/#{@grove.id}"

    click_button 'Edit'

    expect(current_path).to eq("/plots/#{@grove.id}/edit")

    fill_in 'Name', with: 'The Clover Patch'
    click_button 'Update'

    expect(current_path).to eq("/plots/#{@grove.id}")
    expect(page).to have_content('The Clover Patch')
  end

  it 'can update whether a plot is available'

  it 'can update the sun coverage of a plot'

  it 'can update the square footage of a plot'
end
