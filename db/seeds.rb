# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Alex", last_name: "Benwa")
Group.create(name: "Balls")
Group.create(name: "The bangers")
Group.create(name: "Footy")
Membership.create(user_id: 1, group_id: 1)
Membership.create(user_id: 1, group_id: 2)
Membership.create(user_id: 1, group_id: 3)
