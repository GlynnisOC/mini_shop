require 'rails_helper'

RSpec.describe "merchant index" do
  describe "as a visitor" do
    describe "when I visit the index page" do
      it "shows name of each merchant in the system" do
        merchant_1 = Merchant.create(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")

        visit '/merchants'

        expect(page).to have_content(merchant_1.name)
        expect(page).to have_content(merchant_2.name)
      end

      it "has a link for each merchant to their show page" do
        merchant_1 = Merchant.create(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
        merchant_2 = Merchant.create(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")

        visit '/merchants'

        click_link "#{merchant_1.name}"
        expect(current_path).to eq("/merchants/#{merchant_1.id}")

        visit '/merchants'

        click_link "#{merchant_2.name}"
        expect(current_path).to eq("/merchants/#{merchant_2.id}")
      end
    end
  end
end
