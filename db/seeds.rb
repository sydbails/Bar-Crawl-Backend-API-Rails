require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
locations = ["The Roosevelt Room", "Midnight Cowboy", "Small Victory", "The Long Play Lounge", "Garage", "Nickel City", "Velouria", "The Townsend", "Geraldine's", "drink. well.", "Whissler's", "HandleBar Austin", "King Bee Lounge", "Firehouse Lounge", "Weather Up", "Half Step", "Banger's", "Bar Peached", "White Horse", "Academia", "Jackalope", "Craft Pride", "Kitty Cohen's", "Violet Crown Social Club", "Stay Gold", "Casino El Camino", "Cheer Up Charlie's", "lala's", "Halcyon"]
zipcodes = [78610, 78613, 78617, 78641, 78652, 78653, 78660, 78664, 78681, 78701, 78702, 78703, 78704, 78705, 78712, 78717, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 78728, 78729, 78730, 78731, 78732]

100.times do
   user = User.create(
        first_name: Faker::Name.first_name,
        email: Faker::Internet.free_email,
        password: Faker::Internet.password(min_length: 5), 
        birthdate: Faker::Date.birthday(min_age: 21, max_age: 42),
        zipcode: (zipcodes.sample),
        bio: Faker::Hipster.paragraph
    )
end

50.times do
    crawl = Crawl.create(
        user_id: (rand(1..75)),
        location_1: (locations.sample),
        location_2: (locations.sample),
        location_3: (locations.sample),
        start_time: Faker::Time.forward(days: 5,  period: :evening, format: :short)
    )
end

75.times do
    crawler = Crawler.create(
        user_id: (rand(1..40)),
        crawl_id: (rand(1..25))
    )
end
