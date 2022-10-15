require 'rails_helper' 

RSpec.describe '/trails/show.html.erb', type: :feature do
  before(:each) do 
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @telegraph = Trail.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true, area_id: @gulch.id)
    @anasazi = Trail.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true, area_id: @gulch.id)   
    @dutch = Trail.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true, area_id: @hermosa.id)
    @goulding = Trail.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true, area_id: @hermosa.id)
  end
  
  describe 'as a user' do
    describe 'when I visit /trails/:id' do
      it '- shows the trail tied to the specific :id and its attributes' do
        visit "/trails/#{@goulding.id}"

        expect(page).to have_content(@goulding.name)
        expect(page).to have_content(@goulding.difficulty)
        expect(page).to have_content(@goulding.rating)
        expect(page).to have_content(@goulding.length)
        expect(page).to have_content(@goulding.open)
      end

      it '- has a link at the top of the page that takes me to the trails index' do
        visit "/trails/#{@dutch.id}"

        click_link 'Trails Index'
        expect(page).to have_current_path(trails_path)
      end

      it '- has a link at the top of the page that takes me to the areas index' do
        visit "/trails/#{@anasazi.id}"

        click_link 'Areas Index'
        expect(page).to have_current_path(areas_path)
      end
    end
  end
end