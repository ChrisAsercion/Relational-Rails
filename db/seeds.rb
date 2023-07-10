# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Orchestra.destroy_all
Musician.destroy_all

Orchestra.create!(name: "Colorado Symphony Orchestra", chairs: 150, conductor: "Peter Oundjian", active: true, venue: true)
Orchestra.create!(name: "New Orchestra", chairs: 10, conductor: "Group led", active: true, venue: true)
Musician.create!(name: "Victor Wooten", instruments: "bass", songs: 10, on_call: true, orchestra_id: 1)
Musician.create!(name: "Jacqueline du Pre", instruments: "cello", songs: 78, on_call: true, orchestra_id: 1)