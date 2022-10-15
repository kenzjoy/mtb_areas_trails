require 'rails_helper'

RSpec.describe Area, type: :model do
  it {should have_many :trails}

  describe 'instance methods' do
    before(:each) do 
      @gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
      @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
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
  end
end