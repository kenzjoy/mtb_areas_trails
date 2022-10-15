require 'rails_helper'

RSpec.describe '/areas/index.html.erb', type: :feature do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @telegraph = Trail.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true, area_id: @gulch.id)
    @anasazi = Trail.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true, area_id: @gulch.id)   
    @dutch = Trail.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true, area_id: @hermosa.id)
    @goulding = Trail.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true, area_id: @hermosa.id)
  end

  describe 'as a user' do
    describe 'when I visit the areas index' do
      it '- displays the names of each mtb area' do
        visit "/areas"

        expect(page).to have_content(@gulch.name)
        expect(page).to have_content(@hermosa.name)
      end
      
      it '- displays when each area was created with a timestamp' do
        visit "/areas"

        expect(page).to have_content(@gulch.created_at)
        expect(page).to have_content(@hermosa.created_at)
      end

      it '- displays the records ordered by most recently created first' do 
        visit "/areas"

        expect(@hermosa.name).to appear_before(@gulch.name)
        expect(@gulch.name).to_not appear_before(@hermosa.name)
      end
    end
  end
end