# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#---------USERS
(1..5).each do |n|
  user = User.new(
    username: "user#{n}",
    email: "example#{n}@gmail#{n}.com",
    password: "12345678#{n}",
    first_name: "Name#{n}",
    last_name: "Last#{n}"
  )
  user.save!
  puts "user #{n} created"
  Superpower.create!(name: "invisibility#{n}", price: (30+n), description: "become invisible", user_id: user.id)
  puts "superpower #{n} created"
end
