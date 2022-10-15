require 'rails_helper'

RSpec.describe Area, type: :model do
  it {should have_many :trails}

  describe 'instance methods' do
    before(:each) do 
      @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
      @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
      @telegraph = Trail.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true, area_id: @gulch.id)
      @anasazi = Trail.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true, area_id: @gulch.id)   
      @dutch = Trail.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true, area_id: @hermosa.id)
      @goulding = Trail.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true, area_id: @hermosa.id)  
    end

    it '- exists' do
      expect(@gulch).to be_an(Area)
    end

    it '- has attributes' do
      expect(@gulch.name).to eq("Horse Gulch")
      expect(@gulch.peak_elevation).to eq(7900)
      expect(@hermosa.region).to eq("San Juan South")
      expect(@hermosa.alpine).to eq(true)
    end

    it '- has a #trail_count' do
      expect(@gulch.trail_count).to eq(2)
      expect(@hermosa.trail_count).to eq(2)
    end
  end
end