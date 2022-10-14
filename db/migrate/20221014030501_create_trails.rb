class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :difficulty
      t.float :rating
      t.float :length
      t.boolean :open
      t.timestamps
    end
  end
end
