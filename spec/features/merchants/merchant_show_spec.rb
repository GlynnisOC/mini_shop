require 'rails_helper'

RSpec.describe "merchant show" do
  describe "as a visitor" do
    describe "when I visit a specific merchant's page" do
      it "shows me all of that merchant's information" do
        merchant_1 = Merchant.create(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")

        visit "/merchants/#{merchant_1.id}"

        expect(page).to have_content(merchant_1.address)
        expect(page).to have_content(merchant_1.city)
        expect(page).to have_content(merchant_1.zip)

        visit "/merchants/#{merchant_2.id}"
        expect(page).to have_content(merchant_2.address)
        expect(page).to have_content(merchant_2.city)
        expect(page).to have_content(merchant_2.zip)
        expect(page).to_not have_content(merchant_1.name)
      end
    end

    describe "I see a link to edit the merchant" do
      it "after updating returns me to merchant show page with updated information" do
        merchant_1 = Merchant.create(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")

        visit "/merchants/#{merchant_1.id}"

        click_link "Edit"

        expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

        fill_in "Name", with: "Tito's"
        fill_in "Address", with: "123 Street"
        fill_in "City", with: "Nowhere"
        fill_in "State", with: "UT"
        fill_in "Zip", with: "Code"
        click_button "Update Merchant"

        expect(current_path).to eq("/merchants/#{merchant_1.id}")
      end
    end

    describe "I see a link to delete the merchant" do
      it "after updating returns me to merchants index page" do
        merchant_1 = Merchant.create(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")

        visit '/merchants'

        expect(page).to have_content("#{merchant_1.name}")
        expect(page).to have_content("#{merchant_2.name}")

        visit "/merchants/#{merchant_1.id}"

        click_link "Delete"

        expect(current_path).to eq("/merchants")
        expect(page).to_not have_content("#{merchant_1.name}")
      end
    end
  end
end
