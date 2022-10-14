require 'rails_helper'

RSpec.describe 'mtb areas index' do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
  end

  describe 'when a user visits parent page' do
    it 'shows the name of each mtb area' do
      visit "/areas"

      expect(page).to have_content(@gulch.name)
      expect(page).to have_content(@hermosa.name)
    end
  end
end

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system