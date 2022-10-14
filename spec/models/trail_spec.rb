require 'rails_helper'

RSpec.describe Trail, type: :model do
  it {should belong_to :area}

  describe 'instance methods' do
    before(:each) do

    end
  end
end