# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Todo.create!(title: 'grocery shopping', notes: 'pickles, eggs, red onion')
Todo.create!(title: 'wash the car', notes: 'Buy Soap from Giant')
Todo.create!(title: 'check engine light', notes: 'The check engine light is on in the Tacoma')

