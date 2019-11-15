w# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: 'Hygiene & healthcare', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823091/categories/cleaning_iz2fmz.svg')
Category.create!(name: 'Kitchen', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823091/categories/kitchen_zigzli.svg')
Category.create!(name: 'Home maintenance', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573824264/categories/hammer_zsryt4.svg')
Category.create!(name: 'Leasure', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823584/categories/2256950_an0cl2.png')
Category.create!(name: 'Apparel', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823091/categories/fashion_n0hxhd.svg')
Category.create!(name: 'Work', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823092/categories/suitcase_ijpqps.svg')
Category.create!(name: 'Social life', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823483/categories/1344907_ujnazh.png')


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

# 50.times do
#   challenge = Challenge.new(
#     name: Faker::Lorem.sentences,
#     description: Faker::Lorem.paragraph(sentence_count: (5..10).to_a.sample),
#     intensity: [0, 1, 2].sample,
#     map: [true, false].sample,
#     gender_specific: [0, 1, 2].sample,
#     plastic: (10..50).to_a.sample,
#     size: false
#   )
#   challenge.category = Category.all.sample
#   challenge.save
# end

# 20.times do
#   challenge = Challenge.new(
#     name: Faker::Lorem.sentence,
#     description: Faker::Lorem.paragraph(sentence_count: (5..10).to_a.sample),
#     intensity: [0, 1, 2].sample,
#     map: [true, false].sample,
#     gender_specific: [0, 1, 2].sample,
#     plastic: (10..50).to_a.sample,
#     size: true
#   )
#   challenge.category = Category.all.sample
#   challenge.save
# end
challenge = Challenge.new(
   name: "Body wash",
   description: "easy challenge = free XP for you! Go to a nearby shop and buy your first eco soap! You won’t be disappointed we promise you!",
   intensity: 1,
   map: false ,
   gender_specific: 0,
   plastic: 400,
   size: false
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Bamboo toothbrush",
   description: "today, you are done with using plastic toothbrush, go to a nearby shop and finally buy your first bamboo toothbrush. Complete this task and you will feel that you made a big step. Be happy about it and enjoy this happiness.",
   intensity: 2,
   map: false,
   gender_specific: 0,
   plastic: 200,
   size: false
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Toilet paper",
   description: "Americans use 8 million tons of toilet paper a year. If every US house used just one roll of 100% post-consumer recycled TP a year, it would save 423,900 trees.
Don’t be like them, you are way better than that, it is time for a change, today you will go to the shop and either buy a bidet or buy tree free toilet paper. We trust you complete this challenge! GO ON!!!",
   intensity: 2,
   map: false,
   gender_specific: 0,
   plastic: 100,
   size: false
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Zero waste BBQ",
   description: "Let’s be real. It’s almost impossible to throw a totally zero waste BBQ or party. But hosting one that’s (nearly) zero waste is actually pretty easy.
For this challenge, we will give you a few tips to make this change happen.
1. Set yourself up for success by letting people know that your goal is a zero waste party. Explain what that is and give some clear guidelines. Explicitly give your guests guidance, such as ‘Recyclables OK,’ or ‘Please consider bringing your potluck dish in a washable container with a lid rather than covering it with plastic wrap.’
2. Ask people to bring their own utensils and cups for the party, you can suggest them camping tray for example.
3. Give your guests clear guidance on what to do with the various dishes, cups, utensils, recyclables and food waste. You’ll be pleasantly surprised by how many paper plate diehards just roll with it.
4. Hide the trashcan! If they can’t find it, they’ll look for an alternative and use the bus bins and compost! With this sly eco trick, the amount of captured and compostable food waste increases dramatically. Worst case scenario, if they can’t figure out where to throw stuff away, they’ll ask, and you or someone else will redirect them.
5. Build your stash of reusable party-ware over time! If you throw a lot of parties and you have the storage space, it’s worth investing in enough dishes, glasses and utensils for your parties. It’s completely ok to use and (re-use).
Good luck with this challenges, if it’s too cold to throw a BBQ party, get the tip 5 ready during the week and you can consider your challenges as done  ",
   intensity: 3,
   map: false ,
   gender_specific:  0,
   plastic:  1000,
   size: true
 )
challenge.category = Category.all.sample
challenge.save

# 3.times do
#   user1 = User.find(1)
#   # challenge = Challenge.find((1..20).to_a.sample)
#   challenge = Challenge.find(1)
#   userchallenge = WeeklyChallenge.new(
#     )
#   userchallenge.user = user1
#   userchallenge.challenge = challenge
#   userchallenge.save
# end


