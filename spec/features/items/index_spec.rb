require 'rails_helper'

RSpec.describe "items index" do
  it "I see all items" do
    merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
    merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
    blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://images.app.goo.gl/e9LuppxqhePSPhLK9", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
    porter = merchant_2.items.create!(name: "Porter", description: "descriptiontwooooo", price: "4.00", image: "https://images.app.goo.gl/sTBca5us62XDWTC5A", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

    visit '/items'
    save_and_open_page
    expect(page).to have_content(blood_orange.name)
    expect(page).to have_content(blood_orange.description)
    expect(page).to have_content(blood_orange.price)
    expect(page).to have_content(blood_orange.active)
    expect(page).to have_content(blood_orange.inventory)
    expect(page).to have_content(blood_orange.merchant_name)
    expect(page).to have_content(blood_orange.price)
    expect(page).to have_content(porter.name)
    expect(page).to have_content(porter.merchant_name)
    expect(page).to have_content(porter.price)
  end
end
