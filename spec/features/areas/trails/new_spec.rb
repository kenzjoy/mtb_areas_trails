require 'rails_helper'

RSpec.describe '/areas/area_id/trails/new.html.erb' do
  describe 'as a user' do
    describe 'I can fill out a new trail form' do
      before(:each) do
        @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
        @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
        @telegraph = @gulch.trails.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true)
        @anasazi = @gulch.trails.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true)   
        @dutch = @hermosa.trails.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
        @goulding = @hermosa.trails.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)
      end
      
      it '- can be filled out with a new trail and its attributes, and upon 
      clicking the create trail button, it redirects back to the area/trails 
      index where the new area trail is displayed' do
        visit "/areas/#{@hermosa.id}/trails/new"

        fill_in('name', with: 'Pinkerton-Flagstaff')
        fill_in('difficulty', with: 'Black')
        fill_in('rating', with: 3.0)
        fill_in('length', with: 10.8)
        # fill_in('open', with: true)
        click_button('Create Trail')

        expect(current_path).to eq("/areas/#{@hermosa.id}/trails")
        expect(page).to have_content("Pinkerton-Flagstaff")
      end
    end
  end
end