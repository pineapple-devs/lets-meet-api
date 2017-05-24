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

n_meeting_1 = nikola.meetings.create(:title => "Gym with Djoka",
                                     :description => "Get SWOLE")
n_meeting_2 = nikola.meetings.create(:title => "Running with Jana",
                                     :description => "Get RIPPED")

j_meeting_1 = jana.meetings.create(:title => "Movies with Branko",
                                   :description => "Watch Fast&Furious 7")
j_meeting_2 = jana.meetings.create(:title => "Gym with Marina",
                                   :description => "Get LEAN")

m_meeting_1 = marina.meetings.create(:title => "Chill",
                                     :description => "Just relax")
m_meeting_2 = marina.meetings.create(:title => "DOTA with Jana",
                                     :description => "Kill some creeps")

n_meeting_1.intervals.create(:start_time => DateTime.now,
                             :end_time => DateTime.now + 2.hours,
                             :user => nikola)
n_meeting_2.intervals.create(:start_time => DateTime.now + 2.hours,
                             :end_time => DateTime.now + 4.hours,
                             :user => nikola)

j_meeting_1.intervals.create(:start_time => DateTime.now,
                             :end_time => DateTime.now + 2.hours,
                             :user => jana)
j_meeting_2.intervals.create(:start_time => DateTime.now + 2.hours,
                             :end_time => DateTime.now + 4.hours,
                             :user => jana)

m_meeting_1.intervals.create(:start_time => DateTime.now,
                             :end_time => DateTime.now + 2.hours,
                             :user => marina)
m_meeting_2.intervals.create(:start_time => DateTime.now + 2.hours,
                             :end_time => DateTime.now + 4.hours,
                             :user => marina)
