# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.create!(name:  "Maju Bistro",
			             address: "No. 20, Domain 3, Cyberjaya",
			             category:              "24 hour",
			             lat: 2.921157,
			             lng: 101.659212)

30.times do |n|
  name  = Faker::Name.name
  address = Faker::Address.city
  category = "Fast Food"
  Restaurant.create!(name:  name + " Pizza",
               address: address,
               category: category,
               lat: 2.921157 + (n + 10),
               lng: 101.659212 + (n + 10))
end