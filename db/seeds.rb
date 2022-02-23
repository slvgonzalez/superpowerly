# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Superpower.destroy_all
User.destroy_all
superpowers = [
  { name: "super strength", description: "gives the wielder super human strength" },
  { name: "flight", description: "gives the wielder the ability to fly through the skys at supersonic speed" },
  { name: "super human senses", description: "allows the person to user their senses at super human level" },
  { name: "elasticity", description: "can stretch the human body to extreme lengths" },
  { name: "super smell", description: "can smell things from miles away" },
  { name: "invisibility", description: "allows the user to steal banks unnoticed" },
  { name: "stress less", description: "helps the wielder to stress less in hard situations" }
]

#---------USERS
users = []
(1..superpowers.length).each do |n|
  user = User.new(
    username: "user#{n * rand(2..10_000)}",
    email: "example#{n * rand(2..10_000)}@gmail#{n}.com",
    password: "12345678#{n}",
    first_name: "Name#{n}",
    last_name: "Last#{n}"
  )
  user.save!
  users << user.id
  puts "user #{n} created"

#Superpower.create!(name: "invisibility#{n}", price: (30 + n), description: "become invisible", user_id: user.id)
end

#------------SUPERPOWERS
#superpowers.each do |superpower|
super_fast = Superpower.create!(
  name: "Super speed",
  price: 50,
  description: "Gives you the abilities to do everything 10 times faster!⚡️ You can even try to finish your code on time before the presentation!",
  user_id: users.sample)
  file = URI.open("https://image.cnbcfm.com/api/v1/image/100110389-drive-fast-gettyp.jpg?v=1424731075")
super_strength.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
superpower = Superpower.create!(
    name: "Invisibility",
    price: 180,
    description: "Allows the user to steal from banks unnoticed",
    user_id: users.sample)
    file = URI.open("https://res.cloudinary.com/dhcoxs18m/image/upload/v1645626744/vi5sje2kk3agl6ttbxg1.webp")
superpower.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
super_smell = Superpower.create!(
    name: "Super smell",
    price: 20,
    description: "Can smell things from miles away",
    user_id: users.sample)
    file = URI.open("https://res.cloudinary.com/dhcoxs18m/image/upload/v1645629667/mnhnj8gibsg6xrvb4baa.jpg")
super_smell.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
super_strength = Superpower.create!(
    name: "Super strength",
    price: 90,
    description: "Gives the wielder super human strength",
    user_id: users.sample)
    file = URI.open("https://res.cloudinary.com/dhcoxs18m/image/upload/v1645630077/hcb5xzjql6bjjxpjga1v.jpg")
super_strength.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
#end

puts "superpower #{superpowers.length} created"
