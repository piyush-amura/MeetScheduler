# This file should contain all the record creation needed
# to seed the database with its default values.
# The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#
#   Character.create(name: 'Luke', movie: movies.first)
Employee.create(name: 'peiyush', email: 'peh@gmail.com', password: '123456')
Admin.create(name: 'pe', email: 'pe@gmail.com', password: '123456')
Venue.create(name:'venue_1', address: 'pune', capacity: 10, status: 'available')
meet = Meeting.create(date:'2017-10-27', start_time: "2000-01-01 10:29:52", status: "on time", key_note: "second", duration: 30.0, organiser_id: 1, venue_id: 1)
m = Mom.new
m.meeting = meet
m.summary = 'second meeting'
m.save
Agenda.create( mom_id: 1, name: 'first agenda', allocated_time: 30, action: 'first action', status: 'approval needed')
Suggestion.create(user_id: 1, agenda_id: 1, suggestion: 'first suggestion')
