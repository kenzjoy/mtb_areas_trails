require 'rails_helper' 

RSpec.describe '/trails/show.html.erb' do
  before(:each) do 
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @dutch = @hermosa.trails.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
    @goulding = @hermosa.trails.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)
  end
  
  describe 'as a user' do
    describe 'when I visit /trails/:id' do
      it 'shows the trail tied to the specific :id and its attributes' do
        visit "/trails/#{@goulding.id}"

        expect(page).to have_content(@goulding.name)
        expect(page).to have_content(@goulding.difficulty)
        expect(page).to have_content(@goulding.rating)
        expect(page).to have_content(@goulding.length)
        expect(page).to have_content(@goulding.open)
      end
    end
  end
end