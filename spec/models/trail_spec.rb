require 'rails_helper'

RSpec.describe Trail, type: :model do
  it {should belong_to :area}

  describe 'instance methods' do
    before(:each) do
      @hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)
      @dutch = @hermosa.trails.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
      @goulding = @hermosa.trails.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)      
    end

    it 'exists' do
      expect(@dutch).to be_a(Trail)
    end

    it 'has attributes' do
      expect(@dutch.name).to eq("Dutch Creek")
      expect(@dutch.difficulty).to eq("Black")
      expect(@goulding.rating).to eq(3.2)
      expect(@goulding.length).to eq(2.9)
      expect(@goulding.open).to eq(true)
    end
  end
end