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
  it 'can update the name of a plot'

  it 'can update whether a plot is available'

  it 'can update the sun coverage of a plot'

  it 'can update the square footage of a plot'
end
