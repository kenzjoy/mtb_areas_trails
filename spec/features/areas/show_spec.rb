require 'rails_helper' 

RSpec.describe '/areas/show.html.erb', type: :feature do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @telegraph = Trail.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true, area_id: @gulch.id)
    @anasazi = Trail.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true, area_id: @gulch.id)   
    @dutch = Trail.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true, area_id: @hermosa.id)
    @goulding = Trail.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true, area_id: @hermosa.id)
  end

  describe 'as a user' do
    describe 'when I visit /areas/:id' do
      it '- shows the area tied to the specified :id and its attributes' do
        visit "/areas/#{@gulch.id}"

        expect(page).to have_content(@gulch.region)
        expect(page).to have_content(@gulch.peak_elevation)
        expect(page).to have_content(@gulch.alpine)
        expect(page).to_not have_content(@hermosa.region)
      end

      it '- shows a count of the number of trails associated with this area' do
        visit "areas/#{@hermosa.id}"

        expect(page).to have_content("There are #{@hermosa.trail_count} trails in this area.")
      end

      it '- has a link at the top of the page that takes me to the trails index' do
        visit "areas/#{@hermosa.id}"

        click_link 'Trails Index'
        expect(page).to have_current_path(trails_path)
      end
      
      it '- has a link at the top of the page that takes me to the areas index' do
        visit "areas/#{@gulch.id}"

        click_link 'Areas Index'
        expect(page).to have_current_path(areas_path)
      end
    end
  end
end