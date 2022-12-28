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
    contact_mail: "hello@antoinechampenois.com",
    quotes: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    rich_bio: "Après une formation littéraire et philosophique classique, il intègre la Sorbonne en histoire de l’art avant de se consacrer pleinement à l’art contemporain et au commissariat d’exposition en 2019. Son champ d’investigation s’étend des nouvelles technologies et de l’ère digitale aux mécanismes de la pop culture. Cette spécialisation progressive et son goût pour l’écriture l’amènent à collaborer régulièrement avec des magazines ou directement auprès des artistes. Après un passage par TRAM, réseau d’art contemporain d’île-de-France, lui ayant permis de comprendre les enjeux propres au territoire francilien et de mettre à profit des publics son expertise engagée auprès de la jeune création, son parcours l’a mené au FRAC Lorraine (Metz)  pour la production d’expositions et la coordination d’édition.

    Son attrait pour les pratiques collaboratives débordant la sphère de l’art contemporain l’ont conduit naturellement vers une équipe où la transdisciplinarité est une signature, il rejoint le studio Jérôme Sans en mars 2022.",
    admin: true
  )

puts "======📝 Creating Articles"
10.times do
  writing = Writing.create(
    title: Faker::Book.title,
    rich_body: (Faker::Lorem.paragraphs(number: 360)).join,
    tagline: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    date: Faker::Date.between(from: '2020-09-23', to: '2021-04-25'),
    user: one
    )
  writing_img = URI.open('https://source.unsplash.com/random')
  writing.cover.attach(io: writing_img, filename: 'random.png', content_type: 'image/png')
end
puts "======5 Articles created"

puts "======🖼 Creating 5 Projects"
5.times do
  project = Project.create!(
    user_id: User.first.id,
    project_type: %w(exhibition project).sample
    title: Faker::Quote.yoda,
    tagline: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    artists: "#{Faker::Artist.name}, #{Faker::GreekPhilosophers.name}, #{Faker::Artist.name}, #{Faker::Artist.name}",
    institution_name: "Galerie du Lendemain",
    institution_address: "#{Faker::Address.street_name}, #{Faker::Address.city}",
    rich_body: (Faker::Lorem.paragraphs(number: 20)).join,
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    end_date: Faker::Date.between(from: '2020-10-10', to: '2020-10-15'),
  )
  project_img = URI.open('https://source.unsplash.com/random')
  project.cover.attach(io: project_img, filename: 'random.png', content_type: 'image/png')
end
puts "======5 Projects created"
