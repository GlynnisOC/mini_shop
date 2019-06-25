require 'rails_helper'

RSpec.describe "merchant index" do
  describe "as a visitor" do
    describe "when I visit the index page" do
      it "shows name of each merchant in the system" do
        merchant_1 = Merchant.create(name: "Tommyknockers Brewery")
        merchant_2 = Merchant.create(name: "Westbound and Down")

        visit '/merchants'

        expect(page).to have_content(merchant_1.name)
        expect(page).to have_content(merchant_2.name)
      end
    end
  end
end
