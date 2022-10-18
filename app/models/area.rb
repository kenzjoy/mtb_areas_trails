class Area < ApplicationRecord
  has_many :trails, inverse_of: :area

  def trail_count
    self.trails.count
  end

  # def order_by_created_at
  #   order(:created_at)
  # end
end