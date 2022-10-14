# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@gulch = Area.create!(name: "Horse Gulch", region: "Durango, CO", peak_elevation: 7900, alpine: false)
@hermosa = Area.create!(name: "Hermosa Creek", region: "San Juan South", peak_elevation: 10750, alpine: true)

@telegraph = Trail.create!(name: "Telegraph", difficulty: "Blue", rating: 4.0, length: 2.8, open: true)
@anasazi = Trail.create!(name: "Anasazi", difficulty: "Black", rating: 5.0, length: 0.7, open: true)

@dutch = Trail.create!(name: "Dutch Creek", difficulty: "Black", rating: 5.0, length: 5.9, open: true)
@goulding = Trail.create!(name: "Goulding Creek", difficulty: "Double Black", rating: 3.2, length: 2.9, open: true)

