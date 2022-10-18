require 'rails_helper' 

RSpec.describe '/areas/new.html.erb', type: :feature do
  describe 'as a user' do 
    describe 'I can fill out a new area form' do
      it '- can be filled out with a new area and its attributes, and redirects 
        back to the area index where the new area name is displayed' do 
        visit '/areas/new'
        
        fill_in('name', with: 'Coal Bank Pass') 
        fill_in('region', with: 'San Juan Central') 
        fill_in('peak_elevation', with: 12192)
        fill_in('alpine', with: true)
        click_button('Create Area')

        expect(current_path).to eq("/areas")
        expect(page).to have_content("Coal Bank Pass")
      end
    end
  end
end