# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

'require rails_helper'

RSpec.describe '/parents/:id/edit' do
  describe 'as a user' do
    describe 'I can edit an areas attributes' do
      it 'links to the edit area page'
    end
  end
end