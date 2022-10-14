require 'rails_helper' 

RSpec.describe 'the areas show page' do
  before(:each) do
    @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
    @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
  end

  describe 'when a user visits /areas/:id page' do
    it 'shows the area tied to the specified :id and its attributes' do
      visit "/areas/#{@gulch.id}"

      expect(page).to have_content(@gulch.region)
      expect(page).to have_content(@gulch.peak_elevation)
      expect(page).to have_content(@gulch.alpine)
      expect(page).to_not have_content(@hermosa.region)
    end
  end
end