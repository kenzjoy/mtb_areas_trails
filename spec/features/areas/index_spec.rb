require 'rails_helper'

RSpec.describe '/areas/index.html.erb', type: :feature do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
  end

  describe 'as a user' do
    describe 'when I visit the areas index' do
      it 'displays the names of each mtb area' do
        visit "/areas"

        expect(page).to have_content(@gulch.name)
        expect(page).to have_content(@hermosa.name)
      end
    end
  end
end