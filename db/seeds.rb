# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
merchant_3 = Merchant.create!(name: "BeauJo's", address: "addressthree", city: "citythree", state: "statetres", zip: "ziptres")

blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://images.app.goo.gl/e9LuppxqhePSPhLK9", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
saison = merchant_1.items.create!(name: "Saison", description: "descriptiontwo", price: "4.00", image: "http://www.thepourreport.com/wp-content/uploads/2015/12/saison.jpg", active: true, inventory:  1, merchant_id: "#{merchant_1.id}")
brown = merchant_1.items.create!(name: "Brown Ale", description: "descriptionthree", price: "6.00", image: "https://cdn.homebrewersassociation.org/wp-content/uploads/20181003102010/english-bitter-beer-recipe_645x645.jpg", active: true, inventory:  13, merchant_id: "#{merchant_1.id}")
pineapple_ms = merchant_1.items.create!(name: "Pineapple Milkshake", description: "descriptioncuatro", price: "7.00", image: "http://modistbrewing.com/wp-content/uploads/2017/11/IMG_2759.jpg", active: true, inventory:  7, merchant_id: "#{merchant_1.id}")

porter = merchant_2.items.create!(name: "Porter", description: "descriptionfour", price: "4.00", image: "https://2fdltvvn8wp2rn64ywgk8o17-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/baltic-porter-beer.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")
pale = merchant_2.items.create!(name: "Pale Ale", description: "descriptionfive", price: "8.00", image: "https://www.mrbeer.com/media/catalog/product/cache/8872124951f387c8ded3f228faa55bea/b/e/beer-amber-pintulw_2_2.jpg", active: true, inventory:  400, merchant_id: "#{merchant_2.id}")
wit = merchant_2.items.create!(name: "Witbier", description: "descriptionsix", price: "6.50", image: "http://cdn.shopify.com/s/files/1/2032/1329/products/Wit_Beer_800x.jpg?v=1553541493", active: true, inventory:  7, merchant_id: "#{merchant_2.id}")
sour = merchant_2.items.create!(name: "Cucumber Sour", description: "descriptionsiete", price: "4.00", image: "https://www.totalwine.com/dynamic/490x/media/sys_master/twmmedia/h23/he2/10678738386974.png", active: true, inventory:  230, merchant_id: "#{merchant_2.id}")

raspberry = merchant_3.items.create!(name: "Raspberry Wheat", description: "descriptionsssss", price: "9.00", image: "https://1jyd2toklpxma7w23lqt6d4n-wpengine.netdna-ssl.com/wp-content/uploads/2018/04/Razz-Bottle-and-Pint.png", active: true, inventory:  10, merchant_id: "#{merchant_3.id}")
bbp = merchant_3.items.create!(name: "Black Butte Porter", description: "it's dark, get used to it", price: "3.00", image: "https://www.deschutesbrewery.com/wp-content/uploads/2016/12/2017_Black-Butte-Amuse_no_text.jpg", active: true, inventory:  12, merchant_id: "#{merchant_3.id}")
apricot = merchant_3.items.create!(name: "Apricot Blonde", description: "brewery is in Aurora", price: "4.00", image: "https://drydockbrewing.com/wp-content/uploads/2016/11/ApricotBlonde_2-1-1.png", active: true, inventory:  17, merchant_id: "#{merchant_3.id}")
coors = merchant_3.items.create!(name: "Coors Banquet", description: "you thought I'd get this far without including it..?", price: "1.50", image: "https://products2.imgix.drizly.com/ci-coors-banquet-2377c317e74b4b3c.jpeg?auto=format%2Ccompress&fm=jpeg&q=20", active: true, inventory:  99, merchant_id: "#{merchant_3.id}")
