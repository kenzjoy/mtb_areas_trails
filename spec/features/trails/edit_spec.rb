require 'rails_helper'

RSpec.describe '/trails/:id/edit' do 
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
    @telegraph = @gulch.trails.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true)
    @anasazi = @gulch.trails.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true)   
    @dutch = @hermosa.trails.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
    @goulding = @hermosa.trails.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)
  end

  describe 'as a user' do
    describe 'I can edit a trails attributes' do
      it '- sends a patch request to trails/trail_id and that trails info is updated' do
        @mikes = @gulch.trails.create!(name: "Mkes", difficulty: "Blue", rating: 4.0, length: 0.8, open: true)

        visit "/trails/#{@mikes.id}"

        expect(page).to have_content("Mkes")

        visit "/trails/#{@mikes.id}/edit"

        fill_in('Name', with: "Mikes")
        click_button('Update Trail')

        expect(page).to have_current_path("/trails/#{@mikes.id}")
        expect(page).to have_content("Mikes")
      end
    end
  end
end