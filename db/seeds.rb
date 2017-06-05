# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name:  "Rodman Aguirre",
#              email: "rodfagui@gmail.com",
#              password:              "ram28285242",
#              password_confirmation: "ram28285242",
#              admin: true)

# 11.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                admin: false)
# end

users = User.order(:created_at).take(10)
12.times do
  title = Faker::Lorem.sentence(3)
  content = Faker::Lorem.paragraph(25)
  users.each { |user| user.microposts.create!(title: title, content: content) }
end