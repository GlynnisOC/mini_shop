require 'rails_helper'

RSpec.describe "Merchant Items Index" do
  describe "as a visitor" do
    describe "when I visit a specific merchant" do
      it "shows all of that merchant's items" do
        merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
        blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://cdn.beeradvocate.com/im/beers/217637.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        saison = merchant_1.items.create!(name: "Saison", description: "descriptiontwo", price: "4.00", image: "http://www.thepourreport.com/wp-content/uploads/2015/12/saison.jpg", active: true, inventory:  1, merchant_id: "#{merchant_1.id}")
        brown = merchant_1.items.create!(name: "Brown Ale", description: "descriptionthree", price: "6.00", image: "https://cdn.homebrewersassociation.org/wp-content/uploads/20181003102010/english-bitter-beer-recipe_645x645.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        porter = merchant_2.items.create!(name: "Porter", description: "descriptionfour", price: "4.00", image: "https://2fdltvvn8wp2rn64ywgk8o17-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/baltic-porter-beer.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")
        pale = merchant_2.items.create!(name: "Pale Ale", description: "descriptionfive", price: "8.00", image: "https://www.mrbeer.com/media/catalog/product/cache/8872124951f387c8ded3f228faa55bea/b/e/beer-amber-pintulw_2_2.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

        visit "/merchants/#{merchant_1.id}/items"

        expect(page).to have_content(blood_orange.name)
        expect(page).to have_content(blood_orange.price)
        expect(page).to have_xpath("//img[@src='#{blood_orange.image}']")
        expect(page).to have_content(blood_orange.active)
        expect(page).to have_content(blood_orange.inventory)

        expect(page).to_not have_content(porter.name)
        expect(page).to_not have_content(pale.name)

        expect(page).to have_content(saison.name)
        expect(page).to have_content(saison.price)
        expect(page).to have_xpath("//img[@src='#{saison.image}']")
        expect(page).to have_content(saison.active)
        expect(page).to have_content(saison.inventory)

        expect(page).to have_content(brown.name)
        expect(page).to have_content(brown.price)
        expect(page).to have_xpath("//img[@src='#{brown.image}']")
        expect(page).to have_content(brown.active)
        expect(page).to have_content(brown.inventory)

        visit "/merchants/#{merchant_2.id}/items"

        expect(page).to have_content(porter.name)
        expect(page).to have_content(porter.price)
        expect(page).to have_xpath("//img[@src='#{porter.image}']")
        expect(page).to have_content(porter.active)
        expect(page).to have_content(porter.inventory)

        expect(page).to have_content(pale.name)
        expect(page).to have_content(pale.price)
        expect(page).to have_xpath("//img[@src='#{pale.image}']")
        expect(page).to have_content(pale.active)
        expect(page).to have_content(pale.inventory)

        expect(page).to_not have_content(blood_orange.name)
        expect(page).to_not have_content(saison.name)
        expect(page).to_not have_content(brown.name)
      end

      it "has a link to create a new item" do
        merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
        blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://cdn.beeradvocate.com/im/beers/217637.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        saison = merchant_1.items.create!(name: "Saison", description: "descriptiontwo", price: "4.00", image: "http://www.thepourreport.com/wp-content/uploads/2015/12/saison.jpg", active: true, inventory:  1, merchant_id: "#{merchant_1.id}")
        brown = merchant_1.items.create!(name: "Brown Ale", description: "descriptionthree", price: "6.00", image: "https://cdn.homebrewersassociation.org/wp-content/uploads/20181003102010/english-bitter-beer-recipe_645x645.jpg", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
        porter = merchant_2.items.create!(name: "Porter", description: "descriptionfour", price: "4.00", image: "https://2fdltvvn8wp2rn64ywgk8o17-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/baltic-porter-beer.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")
        pale = merchant_2.items.create!(name: "Pale Ale", description: "descriptionfive", price: "8.00", image: "https://www.mrbeer.com/media/catalog/product/cache/8872124951f387c8ded3f228faa55bea/b/e/beer-amber-pintulw_2_2.jpg", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

        visit "/merchants/#{merchant_1.id}/items"

        click_link "Add New Item"

        expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")

        fill_in "Name", with: "newbeer"
        fill_in "Price", with: "1.50"
        fill_in "Description", with: "It's that new new"
        fill_in "Image", with: "https://cdn.pastemagazine.com/www/articles/Best-of-New-Beers-color-main.jpg"
        fill_in "Inventory", with: "4000"

        click_button "Add Item"

        item = Item.last

        expect(current_path).to eq("/merchants/#{merchant_1.id}/items")

        expect(page).to have_content(item.name)
        expect(page).to have_content(item.price)
        expect(page).to have_content(item.active)
        expect(page).to have_content(item.inventory)
      end
    end
  end
end
