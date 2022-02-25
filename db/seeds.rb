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
  { name: "super flight", description: "gives the wielder the ability to fly through the skys at supersonic speed" },
  { name: "super human senses", description: "allows the person to user their senses at super human level" },
  { name: "elasticity", description: "can stretch the human body to extreme lengths" },
  { name: "super smell", description: "can smell things from miles away" },
  { name: "invisibility", description: "allows the user to steal banks unnoticed" },
  { name: "stress less", description: "helps the wielder to stress less in hard situations" }
]
username = ["shaquille_oatmeal", "hanging_with_my_gnomies", "hoosier_daddy", "fast_and_the_curious", "averagestudent", "BadKarma", "google_was_my_idea"]
#---------USERS
users = []
username.each do |user|
  new_user = User.new(
    username: user,
    email: "#{user}@gmail.com",
    password: "123456",
    first_name: "Name",
    last_name: "Last"
  )
  new_user.save!
  users << new_user.id
  puts "user #{user} created"

#Superpower.create!(name: "invisibility#{n}", price: (30 + n), description: "become invisible", user_id: user.id)
end

#------------SUPERPOWERS
#superpowers.each do |superpower|
super_fast = Superpower.create!(
  name: "Super speed",
  price: 50,
  category: "transportation",
  description: "Gives you the abilities to do everything 10 times faster!⚡️ You can even try to finish your code on time before the presentation! Never be late to an appointment, be front row at all of your concerts and beat Usain Bolt!",
  user_id: users.sample)
file = URI.open("https://image.cnbcfm.com/api/v1/image/100110389-drive-fast-gettyp.jpg?v=1424731075")
super_fast.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
superpower = Superpower.create!(
  name: "Invisibility",
  price: 180,
  category: "almighty\ powers",
  description: "Tired of being poor? Tired of sitting in Economy? Become invisible. Go inside the Bank of England and take what you please. Never pay for a First Class ticket, sit in there for the price of this Super Power!",
  user_id: users.sample)
file = URI.open("https://res.cloudinary.com/dhcoxs18m/image/upload/v1645626744/vi5sje2kk3agl6ttbxg1.webp")
superpower.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
super_smell = Superpower.create!(
  name: "Super smell",
  price: 20,
  category: "enhancements",
  description: "Can smell things from miles away. Do you wish you could smell a lie? Smell stress (unless you bought Stress Less)? With your newfound sense of smell, you can smell emotions from miles and miles away.
",
  user_id: users.sample)
file = URI.open("https://res.cloudinary.com/dhcoxs18m/image/upload/v1645629667/mnhnj8gibsg6xrvb4baa.jpg")
super_smell.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
super_strength = Superpower.create!(
  name: "Super strength",
  price: 90,
  category: "enhancements",
  description: "Gives the wielder super human strength",
  user_id: users.sample)
file = URI.open("https://res.cloudinary.com/dhcoxs18m/image/upload/v1645630077/hcb5xzjql6bjjxpjga1v.jpg")
super_strength.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
elasticity = Superpower.create!(
  name: "elasticity",
  price: 60,
  category: "enhancements",
  description: "Can stretch the human body to extreme lengths. Annoyed you can't reach the vodka on the top shelf? Infuriated that you can't get your food from the comfort of your couch? Become flexible. The sky is the limit!",
  user_id: users.sample)
file = URI.open("https://static.wikia.nocookie.net/powerlisting/images/7/77/Egirl2.jpg/revision/latest/scale-to-width-down/250?cb=20141124153159")
elasticity.photo.attach(io: file, filename: 'test.jpg', content_type: 'image/jpg')
super_flight = Superpower.create!(
  name: "super flight",
  price: 80,
  category: "transportation",
  description: "Gives the wielder the ability to fly through the skys at supersonic speed.  It's annoying that we can't fly to Vegas every time we want to have a good night out... oh wait! With Super Flight, you can go anywhere, anytime, and the best part is you don't contribute to carbon emissions!",
  user_id: users.sample)
file = URI.open("https://c8.alamy.com/comp/E4RRAP/superhero-boy-child-flying-upwards-in-the-sky-through-the-clouds-E4RRAP.jpg")
super_flight.photo.attach(io: file, filename: 'test.jpg', content_type: 'image/jpg')
stress_less = Superpower.create!(
  name: "stress less",
  price: 80,
  category: "mental\ powers",
  description: "helps the wielder to stress less in hard situations",
  user_id: users.sample)
file = URI.open("https://executivesupportmagazine.com/wp-content/uploads/2021/02/ii.-Marsha-Egan-Stress-Mess-to-Stress-Less-736-2048x1448.jpg")
stress_less.photo.attach(io: file, filename: 'test.jpg', content_type: 'image/jpg')

puts "superpower #{superpowers.length} created"
