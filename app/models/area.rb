class Area < ApplicationRecord
  has_many :trails

  def trail_count
    self.trails.count
  end
end