# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##=================================================================##
## Categories ##
##=================================================================##

Category.create!(name: 'Hygiene & healthcare', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823091/categories/cleaning_iz2fmz.svg')
Category.create!(name: 'Kitchen', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823091/categories/kitchen_zigzli.svg')
Category.create!(name: 'Home maintenance', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573824264/categories/hammer_zsryt4.svg')
Category.create!(name: 'Leasure', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574076656/categories/leisure_iymdoh.svg')
Category.create!(name: 'Apparel', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823091/categories/fashion_n0hxhd.svg')
Category.create!(name: 'Work', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1573823092/categories/suitcase_ijpqps.svg')
Category.create!(name: 'Social life', photo: 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574076592/categories/social_life_nofvqe.svg')


##=================================================================##
## Random users ##
##=================================================================##

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

##=================================================================##
## Achievements ##
##=================================================================##

AchievementNumber.create!(
  name: "You did 1 challenges! Congrats!!",
  number: 1,
  photo: "https://res.cloudinary.com/dr3uy796x/image/upload/v1574156562/badges_numbers/badgelevel1_e5c6nc.png"
  )

AchievementNumber.create!(
  name: "You did 1 challenge! Congrats!!",
  number: 1
  )

AchievementNumber.create!(
  name: "You did 5 challenges! Congrats!!",
  number: 5,
  photo: "https://res.cloudinary.com/dr3uy796x/image/upload/v1574156562/badges_numbers/badgelevel5_iteh7w.png"
  )

AchievementNumber.create!(
  name: "You did 10 challenges! Congrats!!",
  number: 10,
  photo: "https://res.cloudinary.com/dr3uy796x/image/upload/v1574156562/badges_numbers/badgelevel10_x4wgeb.png"
  )

AchievementNumber.create!(
  name: "You did 20 challenges! Congrats!!",
  number: 20,
  photo: "https://res.cloudinary.com/dr3uy796x/image/upload/v1574156562/badges_numbers/badgelevel20_yocyq5.png"
  )

AchievementNumber.create!(
  name: "You did 30 challenges! Congrats!!",
  number: 30,
  photo: "https://res.cloudinary.com/dr3uy796x/image/upload/v1574156562/badges_numbers/badgelevel30_cg96z1.png"
  )

Category.all.each do |category|
  AchievementCategory.create!(
    name: "You did all the challenges from the category #{category.name}. Congrats!!",
    category: category
  )
end

AchievementCategory.all.each do |achievementcat|
  case achievementcat.category.name
  when 'Hygiene & healthcare'
    achievementcat.photo = 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574077938/badges_categories/badge_hygiene_un4sr7.png'
  when 'Kitchen'
    achievementcat.photo = 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574077938/badges_categories/badge_kitchen_wjzrja.png'
  when 'Home maintenance'
    achievementcat.photo = 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574077938/badges_categories/badge_homemaintenance_vd0e7n.png'
  when 'Leasure'
    achievementcat.photo = 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574077938/badges_categories/badge_leisure_e6v71a.png'
  when 'Apparel'
    achievementcat.photo = 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574077938/badges_categories/badge_apparel_aeqvip.png'
  when 'Work'
    achievementcat.photo = 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574077938/badges_categories/badge_work_zpvmmr.png'
  when 'Social life'
    achievementcat.photo = 'https://res.cloudinary.com/dr3uy796x/image/upload/v1574077938/badges_categories/badge_social_life_aq9eec.png'
  end
  achievementcat.save!
end


##=================================================================##
## Paolo challenges ##
##=================================================================##
challenge = Challenge.new(
   name: "Body wash",
   description: "easy challenge = free XP for you! Go to a nearby shop and buy your first eco soap! You won’t be disappointed we promise you!",
   short_description: "easy challenge = free XP for you! Go to a nearby shop and buy your first eco soap! You won’t be disappointed we promise you!",
   intensity: 1,
   map: false,
   gender_specific: 0,
   plastic: 400,
   size: false,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/QMAo9O40zp0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
   )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Bamboo toothbrush",
   description: "today, you are done with using plastic toothbrush, go to a nearby shop and finally buy your first bamboo toothbrush. Complete this task and you will feel that you made a big step. Be happy about it and enjoy this happiness.",
   short_description: "today, you are done with using plastic toothbrush, go to a nearby shop and finally buy your first bamboo toothbrush. Complete this task and you will feel that you made a big step. Be happy about it and enjoy this happiness.",
   intensity: 2,
   map: false,
   gender_specific: 0,
   plastic: 200,
   size: false,
   video_link: "<iframe width='560' height='315' src='https://www.youtube.com/embed/E8S0Pz-KskE' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Toilet paper",
   description: "Americans use 8 million tons of toilet paper a year. If every US house used just one roll of 100% post-consumer recycled TP a year, it would save 423,900 trees.
   Don’t be like them, you are way better than that, it is time for a change, today you will go to the shop and either buy a bidet or buy tree free toilet paper. We trust you complete this challenge! GO ON!!!",
   short_description: "Americans use 8 million tons of toilet paper a year. If every US house used just one roll of 100% post-consumer recycled TP a year, it would save 423,900 trees. It is your turn now!",
   intensity: 2,
   map: false,
   gender_specific: 0,
   plastic: 100,
   size: false,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/QyKnnioHtWw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Zero waste BBQ",
   description: "Let’s be honest. It’s almost impossible to throw a totally zero waste BBQ or party. But hosting one that’s (nearly) zero waste is actually pretty easy.
    For this challenge, we will give you a few tips to make this change happen.<br>
    <br>1. Set yourself up for success by letting people know that your goal is a zero waste party. Explain what that is and give some clear guidelines. Explicitly give your guests guidance, such as ‘Recyclables OK,’ or ‘Please consider bringing your potluck dish in a washable container with a lid rather than covering it with plastic wrap.’
    <br>2. Ask people to bring their own utensils and cups for the party, you can suggest them camping tray for example.
    <br>3. Give your guests clear guidance on what to do with the various dishes, cups, utensils, recyclables and food waste. You’ll be pleasantly surprised by how many paper plate diehards just roll with it.
    <br>4. Hide the trashcan! If they can’t find it, they’ll look for an alternative and use the bus bins and compost! With this sly eco trick, the amount of captured and compostable food waste increases dramatically. Worst case scenario, if they can’t figure out where to throw stuff away, they’ll ask, and you or someone else will redirect them.
    <br>5. Build your stash of reusable party-ware over time! If you throw a lot of parties and you have the storage space, it’s worth investing in enough dishes, glasses and utensils for your parties. It’s completely ok to use and (re-use).<br>
    Good luck with this challenges, if it’s too cold to throw a BBQ party, get the tip 5 ready during the week and you can consider your challenges as done",
   short_description: "Let’s be honest. It’s almost impossible to throw a totally zero waste BBQ or party. But hosting one that’s (nearly) zero waste is actually pretty easy. find a step by step guide in the description",
   intensity: 3,
   map: false,
   gender_specific:  0,
   plastic:  1000,
   size: true,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/q8Pybboa3Lg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "No to straws",
   description: "STRAW NO MORE ! It’s destroying our oceans, over 500 million straws are used every single day.. thus, for this week you will have to go to a shop and buy your first metal or else straw, the challenge is to avoid completely the use of a plastic straw during the whole 7 days in every single place. Good luck with it and as a tip, never forget your straw, take it everywhere. ",
   short_description: "STRAW NO MORE ! It’s destroying our oceans, over 500 million straws are used every single day.. It's time to change this. ",
   intensity: 3,
   map: false,
   gender_specific: 0,
   plastic: 70,
   size: true,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/_CAim_uGjcI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Save the water",
   description: "little fact: Only 1% of all the earths water is actually drinkable. We're so used to turning on the faucet, we forget it isn't infinite. All of us taking small measures to help reduce water, adds up to big impact! Save water! I've compiled a list of my top 10 easiest ways to save water without even trying ! Turn off the faucet: Whether you're washing you're hands, face, or brushing your teeth. Turn off the faucet while its not in direct use.<br>
    <br>1.  Keep it full: If you're doing a load of laundry or dishes, make sure the load is full! Using a dishwasher uses less water than hand washing. If you don't have a dishwasher, (like me) plug the sink. Fill it with a little water. Wash all of the dishes in the tub, and then rinse them.<br>
    <br>2.  Use a bowl: When washing produce, do it in a bowl or a tub, so you don't have to keep the water running.<br>
    <br>3.  Catch the ice cubes: Most of the time my dog gets to them first. But, if Nala isn't around I like to place them in my plants.<br>
    <br>4.  Keep a bucket in the shower: We keep a bucket in the shower to catch water. We use it to water the house plants. Or I'll hand wash my delicates in the bucket and take them out to dry.<br>
    <br>5.  Water in the morning: If you have a lawn, don't water it every day. And, when you do water it, make it count. Do it early in the morning when it's not windy. You'll have less evaporation occur.<br>
    <br>6.  Mellow: We're big believers in yellow let it mellow.<br>
    <br>7.  Break out the real plates: People often advocate for disposables; because, washing dishes wastes water. Which couldn't be more false. It takes 8 gallons of water to make one paper plate and 3.4 liters of water to make one half liter of water. Do you think it would take you 9 gallons of water to was a cup and a plate?<br>
    <br>8.  Fix your leaks: Give your pipes a good tightening!<br>
    <br>9.  Upgrade: Low flow toilets, low flow shower heads, gray water tanks, and changing up your landscape, there is so much you can do to make your home more efficient when it comes to water.<br>
    Good luck for this challenge !
    ",
   short_description: "Only 1% of all the earths water is actually drinkable. We're so used to turning on the faucet, we forget it isn't infinite. All of us taking small measures to help reduce water, adds up to big impact! Save water!",
   intensity: 3,
   map: false,
   gender_specific: 0,
   plastic: 0,
   size: true,
   video_link: '
<iframe width="560" height="315" src="https://www.youtube.com/embed/5J3cw4biWWo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
'
   )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Walk and Bike week",
   description: "This challenge is simple to understand but might be hard to complete, this week challenge is simple, no car, no public transports only walk and  bike. We understand it is an hard challenge for most people, good luck with that, we trust you! ",
   short_description: "This challenge is simple to understand but might be hard to complete, this week challenge is simple, no car, no public transports only walk and  bike. We understand it is an hard challenge for most people, good luck with that, we trust you! ",
   intensity: 3,
   map: false,
   gender_specific: 0,
   plastic: 0,
   size: true,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/88daKoFHepc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Farmers market",
   description: "Supporting local farmers is so good for the environment and local economy. It also puts a face behind the food you consume, a key step that’s missing at the supermarket. You never get to meet the people who grew your food at the grocery store.
   Challenge: a week with only farmers market food. Don’t forget, use reusable bags only, NO plastic allowed in this challenge of course.",
   short_description: "Supporting local farmers is so good for the environment and local economy. It also puts a face behind the food you consume, let's give it a try!",
   intensity: 3,
   map: false,
   gender_specific: 0,
   plastic: 100,
   size: true,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/3ClRZiwHptA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
   )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "Bring your own mug",
   description: "STOP going to the coffee shop nearby and using a different cup every day. In today’s challenges you have to buy your own mug that you’ll use every day so choose it well it will become your new daily best friend.
   Challenge: go to your coffee shop and ask them to serve you your coffee in your mug and nowhere else, ",
   short_description: "STOP going to the coffee shop nearby and using a different cup every day, take your own",
   intensity: 2,
   map: false,
   gender_specific: 0,
   plastic: 300,
   size: false,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/iQZmK9nRilk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
   )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name:"Coffee cup",
   description:"500 billion disposable cups are produced every year. Most of them can't be recycled because they're lined with plastic. If you're sitting in the coffee shop ask for a mug to stay. Or take your own mug and ask the shop to fill it! ",
   short_description: "500 billion disposable cups are produced every year. Most of them can't be recycled because they're lined with plastic. Let's make a -1 on this count today!",
   intensity: 1,
   map: false,
   gender_specific: 0,
   plastic: 500,
   size: false,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/kMX7aQpIwl4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
 )
challenge.category = Category.all.sample
challenge.save

challenge = Challenge.new(
   name: "No cotton earbuds",
   description: "We all know what plastic Earbuds do to our oceans, it is time for you to go to the nearest pharmacy and buy your first and last stainless steel pick! ",
   short_description: "We all know what plastic Earbuds do to our oceans, it is time for you to go to the nearest pharmacy and buy your first and last stainless steel pick!",
   intensity: 1,
   map: false,
   gender_specific: 0,
   plastic: 400,
   size: false,
   video_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/bRIv3cLAO4I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
 )
challenge.category = Category.all.sample
challenge.save

# challenge = Challenge.new(
#    name: '',
#    description:'',
#    short_description: '',
#    intensity: 1,
#    map: false,
#    gender_specific: 0,
#    plastic: 500,
#    size: false,
#    video_link: ''
#  )
# challenge.category = Category.all.sample
# challenge.save

# challenge = Challenge.new(
#    name: '',
#    description:'',
#    short_description: '',
#    intensity: 1,
#    map: false,
#    gender_specific: 0,
#    plastic: 500,
#    size: false,
#    video_link: ''
#  )
# challenge.category = Category.all.sample
# challenge.save

# challenge = Challenge.new(
#    name: '',
#    description:'',
#    short_description: '',
#    intensity: 1,
#    map: false,
#    gender_specific: 0,
#    plastic: 500,
#    size: false,
#    video_link: ''
#  )
# challenge.category = Category.all.sample
# challenge.save

# challenge = Challenge.new(
#    name: '',
#    description:'',
#    short_description: '',
#    intensity: 1,
#    map: false,
#    gender_specific: 0,
#    plastic: 500,
#    size: false,
#    video_link: ''
#  )
# challenge.category = Category.all.sample
# challenge.save


##=================================================================##
## Journal of a primary user ##
##=================================================================##

primary_user = User.create!(
    email: 'antoine.braconnier@hotmail.com',
    username: 'Antoine',
    password: '123456',
    xp: 20,
    level: 7,
    gender: 2,
    address: 'Brussels',
    tree_count: 8
)

big_challenges = Challenge.where(size: true)
small_challenges = Challenge.where(size: false)

WeeklyChallenge.create!(
  status_challenge: false,
  challenge: big_challenges.sample,
  user: primary_user,
  week: Date.today.cweek,
  year: 2019
)

2.times do WeeklyChallenge.create!(
  status_challenge: false,
  challenge: small_challenges.sample,
  user: primary_user,
  week: Date.today.cweek,
  year: 2019
)
end

15.times do WeeklyChallenge.create!(
  status_challenge: true,
  challenge: small_challenges.sample,
  user: primary_user,
  week: (35..46).to_a.sample,
  year: 2019
  )
end

7.times do WeeklyChallenge.create!(
  status_challenge: true,
  challenge: big_challenges.sample,
  user: primary_user,
  week: (35..46).to_a.sample,
  year: 2019
  )
end


5.times do Success.create!(
  user: primary_user,
  achievement: AchievementNumber.all.sample,
  week: (35..46).to_a.sample,
  year: 2019
  )
end

5.times do Success.create!(
  user: primary_user,
  achievement: AchievementCategory.all.sample,
  week: (35..46).to_a.sample,
  year: 2019
  )
end

partner = Partner.create!(
  name: 'The Barn Bio Market',
  address: 'Place Saint-Pierre 38, 1040 Etterbeek'
  )

deal = Deal.new
deal.challenge = Challenge.find(1)
deal.partner = partner
deal.save

partner = Partner.create!(
  name: 'Stock',
  address: 'Place Fernand Cocq 23, Bruxelles'
  )

deal = Deal.new
deal.challenge = Challenge.find(1)
deal.partner = partner
deal.save

# challenge = Challenge.new(
#    name: '',
#    description:'',
#    short_description: '',
#    intensity: 1,
#    map: false,
#    gender_specific: 0,
#    plastic: 500,
#    size: false,
#    video_link: ''
#  )
# challenge.category = Category.all.sample
# challenge.save
