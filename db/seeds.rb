# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create!(name: 'Hygiene & healthcare')
Category.create!(name: 'Kitchen')
Category.create!(name: 'Home maintenance')
Category.create!(name: 'Leasure')
Category.create!(name: 'Apparel')
Category.create!(name: 'Work')
Category.create!(name: 'Social life')

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
    name: Faker::Lorem.sentences,
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
