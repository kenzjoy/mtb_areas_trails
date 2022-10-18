require 'rails_helper'

RSpec.describe '/areas/:id/edit', type: :feature do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @telegraph = @gulch.trails.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true)
    @anasazi = @gulch.trails.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true)   
    @dutch = @hermosa.trails.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
    @goulding = @hermosa.trails.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)
  end

  describe 'as a user' do
    describe 'I can edit an areas attributes' do
      it '- sends a patch request to area/area_id and that areas info is updated' do
        @phils = Area.create!(name: "Pil's Wrld", region: "Cortez, CO", peak_elevation: 6650, alpine: false)

        visit "/areas/#{@phils.id}"
        
        expect(page).to have_content("Pil's Wrld")

        visit "/areas/#{@phils.id}/edit"
    
        fill_in('Name', with: "Phil's World")
        click_button('Update Area')

        expect(page).to have_current_path("/areas/#{@phils.id}")
        expect(page).to have_content("Phil's World")
      end
    end
  end
end