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
  end
end
