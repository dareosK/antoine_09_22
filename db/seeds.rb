# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "date"
require "open-uri"
require 'faker'

puts "======👨‍🦰👳‍♀️ Creating Antoine"
one = User.create!(
    email: "one@mail.com",
    password: "123456",
    admin: true
  )

puts "======📝 Creating Articles"
10.times do
  article = Writing.create(
    title: Faker::Quote.yoda,
    # rich_body: (Faker::Lorem.paragraphs(number: 360)).join,
    tagline: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    date: Faker::Date.between(from: '2020-09-23', to: '2021-04-25'),
    # author: Faker::Name.name_with_middle,
    user: one
    )
  # article_img = URI.open('https://source.unsplash.com/random')
  # article.photo.attach(io: article_img, filename: 'random.png', content_type: 'image/png')
end
puts "======5 Articles created"
