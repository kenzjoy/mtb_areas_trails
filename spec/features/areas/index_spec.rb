require 'rails_helper'

RSpec.describe '/areas/index.html.erb', type: :feature do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
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

      it '- has a link at the top of the page that takes me to the trails index' do
        visit "/areas"

        click_link 'Trails Index'
        expect(page).to have_current_path(trails_path)
      end

      it '- has a link at the top of the page that takes me to the areas index' do
        visit "/areas"

        click_link 'Areas Index'
        expect(page).to have_current_path(areas_path)
      end

      it '- has a link to areas/new where I can create a new area' do

      end

      xit '- a new area is displayed on the area/index page' do

      end
    end
  end
end