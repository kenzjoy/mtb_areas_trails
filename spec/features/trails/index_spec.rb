require 'rails_helper'

RSpec.describe '/trails/index.html.erb', type: :feature do
  before(:each) do
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @dutch = @hermosa.trails.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
    @goulding = @hermosa.trails.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)      
  end

  describe 'as a user' do
    describe 'when I visit the trails index' do
      it '- displays each trail and its attributes' do
        visit "/trails"

        expect(page).to have_content(@dutch.name)
        expect(page).to have_content(@goulding.difficulty)
        expect(page).to have_content(@dutch.rating)
        expect(page).to have_content(@goulding.length)
        expect(page).to have_content(@dutch.open)
      end

      it '- has a link at the top of the page that takes me to the trails index' do
        visit "/trails"

        click_link 'Trails Index'
        expect(page).to have_current_path(trails_path)
      end
    end
  end
end
