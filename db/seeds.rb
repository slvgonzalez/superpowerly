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
  { name: "super strength", description: "gives the wielder super human strengths" },
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
superpowers.each do |superpower|
  Superpower.create!(
    name: superpower[:name],
    price: 30,
    description: superpower[:description],
    user_id: users.sample
  )
end

puts "superpower #{superpowers.length} created"
