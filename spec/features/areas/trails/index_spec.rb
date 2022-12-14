require 'rails_helper'

RSpec.describe '/areas/area_id/trails/index.html.erb', type: :feature do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @telegraph = @gulch.trails.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true)
    @anasazi = @gulch.trails.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true)   
    @dutch = @hermosa.trails.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
    @goulding = @hermosa.trails.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)
  end

  describe 'as as user' do
    describe 'when I visit the area_id/trails index' do
      it '- displays each trail that is associated with that area along with the trail attributes' do
        visit "/areas/#{@gulch.id}/trails"

        expect(page).to have_content(@anasazi.name)
        expect(page).to have_content(@anasazi.difficulty)
        expect(page).to have_content(@anasazi.rating)
        expect(page).to have_content(@telegraph.length)
        expect(page).to have_content(@telegraph.open)
        expect(page).to_not have_content(@goulding.name)
        expect(page).to_not have_content(@dutch.attributes)
      end

      it '- has a link to /areas/area_id/trails/new where I can create a new trail' do
        visit "/areas/#{@hermosa.id}/trails"

        click_link('Create Trail')
        expect(current_path).to eq("/areas/#{@hermosa.id}/trails/new")
      end
    end
  end
end
