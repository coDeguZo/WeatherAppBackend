# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create(name: "Uzoma", email: "u.ariguzo.us@gmail.com", address: "11720 Whittier Rd", password: "test1")
user2 = User.create(name: "Amanda", email: "azimmerman73@gmail.com", address: "2103 Memorial Chapel", password: "password")
