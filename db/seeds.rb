# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username:  "admin",
             email: "admin@gm.com",
             password: "admin123",
             password_confirmation: "admin123",
             admin: true)

# add user 
99.times do |n|
  username  = "user-#{n+1}"
  email = "user-#{n+1}@gm.com"
  password = "password"
  user = User.create!(username:  username,
               email: email,
               password: password,
               password_confirmation: password)

  # add 5 book with user
  5.times do |n|
    cover = nil
    name = "Book's name #{n+1}"
    description = "Book's description #{n+1}"

    Book.create!(cover:  cover,
               name: name,
               description: description,
               owner_id: user.id)
  end
end

#add book
