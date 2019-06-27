require 'rails_helper'

RSpec.describe Item do
  describe "relationships" do
    it { should belong_to :merchant}
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :image }
    it { should validate_presence_of :active }
    it { should validate_presence_of :inventory }
    it { should validate_presence_of :merchant_id }
  end

  describe "instance methods" do
    it "#merchant_name" do
      merchant_1 = Merchant.create!(name: "Tommyknockers Brewery", address: "address", city: "city", state: "state", zip: "zip")
      merchant_2 = Merchant.create!(name: "Westbound and Down", address: "addresstoo", city: "citytoo", state: "statetoo", zip: "ziptoo")
      blood_orange = merchant_1.items.create!(name: "Blood Orange IPA", description: "description", price: "2.00", image: "https://images.app.goo.gl/e9LuppxqhePSPhLK9", active: true, inventory:  5, merchant_id: "#{merchant_1.id}")
      porter = merchant_2.items.create!(name: "Porter", description: "descriptiontwooooo", price: "4.00", image: "https://images.app.goo.gl/sTBca5us62XDWTC5A", active: true, inventory:  2, merchant_id: "#{merchant_2.id}")

      expect(blood_orange.merchant_name).to eq("Tommyknockers Brewery")
      expect(porter.merchant_name).to eq("Westbound and Down")
    end
  end
end
