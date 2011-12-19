# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts ' *** Empty the MongoDB database ***'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts ' *** Setting up default user login and roles ***'

r = Role.create! title: 'admin'
Role.create! title: 'moderator'

u = User.new name:'Isaac Wooten', email:'i.wooten@gmail.com', password:'wooteni', password_confirmation:'wooteni'
u.roles << r
u.save!

puts 'New user created: ' << u.name