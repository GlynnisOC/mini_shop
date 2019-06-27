# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")

blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://images.app.goo.gl/e9LuppxqhePSPhLK9", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
