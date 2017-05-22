# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nikola = User.create(:name => "nikolalsvk", :email => "nikolaseap@gmail.com")
jana = User.create(:name => "janavojnovic", :email => "jana_vojnovic@hotmail.com")
marina = User.create(:name => "marinanenic", :email => "marina_nenic@hotmail.com")

nikola.meetings.create(:title => "Gym with Djoka",
                       :description => "Get SWOLE")
nikola.meetings.create(:title => "Running with Jana",
                       :description => "Get RIPPED")

jana.meetings.create(:title => "Movies with Branko",
                     :description => "Watch Fast&Furious 7")
jana.meetings.create(:title => "Gym with Maring",
                     :description => "Get LEAN")

marina.meetings.create(:title => "Chill",
                       :description => "Just relax")
marina.meetings.create(:title => "DOTA with Jana",
                       :description => "Kill some creeps")
