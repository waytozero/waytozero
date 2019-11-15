# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create!(name: 'Hygiene & healthcare', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/c_scale,e_blur:100,w_875/v1572601779/samples/food/spices.jpg')
Category.create!(name: 'Kitchen', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1572601772/samples/food/pot-mussels.jpg')
Category.create!(name: 'Home maintenance', photo:'https://res.cloudinary.com/dr3uy796x/image/upload/v1572601772/samples/food/fish-vegetables.jpg')
Category.create!(name: 'Leasure', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1572601770/samples/food/dessert.jpg')
Category.create!(name: 'Apparel', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1572601775/samples/people/jazz.jpg')
Category.create!(name: 'Work', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1572601775/samples/people/boy-snow-hoodie.jpg')
Category.create!(name: 'Social life', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1572601773/samples/people/smiling-man.jpg')

15.times do
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: 123456,
    xp: (0..1000).to_a.sample,
    level: (0..50).to_a.sample,
    gender: (0..2).to_a.sample,
    address: Faker::Address.full_address,
    tree_count: (0..10).to_a.sample
  )
end

50.times do
  challenge = Challenge.new(
    name: Faker::Lorem.sentences,
    description: Faker::Lorem.paragraph(sentence_count: (5..10).to_a.sample),
    intensity: [0, 1, 2].sample,
    map: [true, false].sample,
    gender_specific: [0, 1, 2].sample,
    plastic: (10..50).to_a.sample,
    size: false
  )
  challenge.category = Category.all.sample
  challenge.save
end

20.times do
  challenge = Challenge.new(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(sentence_count: (5..10).to_a.sample),
    intensity: [0, 1, 2].sample,
    map: [true, false].sample,
    gender_specific: [0, 1, 2].sample,
    plastic: (10..50).to_a.sample,
    size: true
  )
  challenge.category = Category.all.sample
  challenge.save
end

3.times do
  user1 = User.find(1)
  challenge = Challenge.find((1..20).to_a.sample)
  userchallenge = WeeklyChallenge.new(
    )
  userchallenge.user = user1
  userchallenge.challenge = challenge
  userchallenge.save
end
