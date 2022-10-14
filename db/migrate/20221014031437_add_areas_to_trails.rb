class AddAreasToTrails < ActiveRecord::Migration[5.2]
  def change
    add_reference :trails, :area, foreign_key: true
  end
end
