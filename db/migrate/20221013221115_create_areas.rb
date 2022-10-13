class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :region
      t.integer :peak_elevation
      t.boolean :alpine

      t.timestamps
    end
  end
end
