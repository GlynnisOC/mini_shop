require 'rails_helper'

RSpec.describe "item show" do
  describe "as a visitor" do
    describe "visiting a specific item's page" do
      it "shows me the item's info and merchant it belongs to" do
        merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
        blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://cdn.beeradvocate.com/im/beers/217637.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        saison = merchant_1.items.create!(name: "Saison", description: "descriptiontwo", price: "4.00", image: "http://www.thepourreport.com/wp-content/uploads/2015/12/saison.jpg", active: true, inventory:  1, merchant_id: "#{merchant_1.id}")
        brown = merchant_1.items.create!(name: "Brown Ale", description: "descriptionthree", price: "6.00", image: "https://cdn.homebrewersassociation.org/wp-content/uploads/20181003102010/english-bitter-beer-recipe_645x645.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        porter = merchant_2.items.create!(name: "Porter", description: "descriptionfour", price: "4.00", image: "https://2fdltvvn8wp2rn64ywgk8o17-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/baltic-porter-beer.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")
        pale = merchant_2.items.create!(name: "Pale Ale", description: "descriptionfive", price: "8.00", image: "https://www.mrbeer.com/media/catalog/product/cache/8872124951f387c8ded3f228faa55bea/b/e/beer-amber-pintulw_2_2.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

        visit "/items/#{blood_orange.id}"

        expect(page).to have_content(blood_orange.name)
        expect(page).to have_xpath("//img[@src='#{blood_orange.image}']")
        expect(page).to have_content(blood_orange.active)
        expect(page).to have_content(blood_orange.price)
        expect(page).to have_content(blood_orange.description)
        expect(page).to have_content(blood_orange.inventory)
        expect(page).to have_content(blood_orange.merchant_name)
      end

      it "has a link to update the item" do
        merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
        blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://cdn.beeradvocate.com/im/beers/217637.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        saison = merchant_1.items.create!(name: "Saison", description: "descriptiontwo", price: "4.00", image: "http://www.thepourreport.com/wp-content/uploads/2015/12/saison.jpg", active: true, inventory:  1, merchant_id: "#{merchant_1.id}")
        brown = merchant_1.items.create!(name: "Brown Ale", description: "descriptionthree", price: "6.00", image: "https://cdn.homebrewersassociation.org/wp-content/uploads/20181003102010/english-bitter-beer-recipe_645x645.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        porter = merchant_2.items.create!(name: "Porter", description: "descriptionfour", price: "4.00", image: "https://2fdltvvn8wp2rn64ywgk8o17-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/baltic-porter-beer.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")
        pale = merchant_2.items.create!(name: "Pale Ale", description: "descriptionfive", price: "8.00", image: "https://www.mrbeer.com/media/catalog/product/cache/8872124951f387c8ded3f228faa55bea/b/e/beer-amber-pintulw_2_2.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

        visit "/items/#{blood_orange.id}"

        click_link "Edit Item"

        expect(current_path).to eq("/items/#{blood_orange.id}/edit")

        fill_in "Name", with: "mare"
        fill_in "Price", with: "200.00"
        fill_in "Description", with: "night"
        fill_in "Image", with: "http://static.shoplightspeed.com/shops/609604/files/002695350/262x276x1/olde-saratoga-saratoga-death-wish-nightmare-ipa-22.jpg"
        fill_in "Inventory", with: "100000"

        click_button "Update Item"
        blood_orange.reload

        expect(current_path).to eq("/items/#{blood_orange.id}")

        expect(page).to have_content(blood_orange.name)
        expect(page).to have_content(blood_orange.price)
        expect(page).to have_content(blood_orange.description)
        expect(page).to have_content(blood_orange.inventory)
      end
    end

    describe "I can click on the merchant's name" do
      it "takes me to the merchant's page" do
        merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
        blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://cdn.beeradvocate.com/im/beers/217637.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        saison = merchant_1.items.create!(name: "Saison", description: "descriptiontwo", price: "4.00", image: "http://www.thepourreport.com/wp-content/uploads/2015/12/saison.jpg", active: true, inventory:  1, merchant_id: "#{merchant_1.id}")
        brown = merchant_1.items.create!(name: "Brown Ale", description: "descriptionthree", price: "6.00", image: "https://cdn.homebrewersassociation.org/wp-content/uploads/20181003102010/english-bitter-beer-recipe_645x645.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        porter = merchant_2.items.create!(name: "Porter", description: "descriptionfour", price: "4.00", image: "https://2fdltvvn8wp2rn64ywgk8o17-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/baltic-porter-beer.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")
        pale = merchant_2.items.create!(name: "Pale Ale", description: "descriptionfive", price: "8.00", image: "https://www.mrbeer.com/media/catalog/product/cache/8872124951f387c8ded3f228faa55bea/b/e/beer-amber-pintulw_2_2.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

        visit "/items/#{blood_orange.id}"

        click_link "#{merchant_1.name}"
        expect(current_path).to eq("/merchants/#{merchant_1.id}")

        visit "/items/#{porter.id}"

        click_link "#{merchant_2.name}"
        expect(current_path).to eq("/merchants/#{merchant_2.id}")
      end
    end

    describe "I can click on the item's name" do
      it "takes me to the item's page" do
        merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
        blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://cdn.beeradvocate.com/im/beers/217637.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        saison = merchant_1.items.create!(name: "Saison", description: "descriptiontwo", price: "4.00", image: "http://www.thepourreport.com/wp-content/uploads/2015/12/saison.jpg", active: true, inventory:  1, merchant_id: "#{merchant_1.id}")
        brown = merchant_1.items.create!(name: "Brown Ale", description: "descriptionthree", price: "6.00", image: "https://cdn.homebrewersassociation.org/wp-content/uploads/20181003102010/english-bitter-beer-recipe_645x645.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        porter = merchant_2.items.create!(name: "Porter", description: "descriptionfour", price: "4.00", image: "https://2fdltvvn8wp2rn64ywgk8o17-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/baltic-porter-beer.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")
        pale = merchant_2.items.create!(name: "Pale Ale", description: "descriptionfive", price: "8.00", image: "https://www.mrbeer.com/media/catalog/product/cache/8872124951f387c8ded3f228faa55bea/b/e/beer-amber-pintulw_2_2.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

        visit "/items/#{blood_orange.id}"

        click_link "#{blood_orange.name}"
        expect(current_path).to eq("/items/#{blood_orange.id}")

        visit "/items/#{porter.id}"

        click_link "#{porter.name}"
        expect(current_path).to eq("/items/#{porter.id}")
      end
    end
  end
end
