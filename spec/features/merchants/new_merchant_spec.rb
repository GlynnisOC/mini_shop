require 'rails_helper'

RSpec.describe "new merchant" do
  describe "as a visitor" do
    describe "I am able to add a merchant" do
      it "then redirected to the index and see the new merchant" do

        visit '/merchants'

        click_link "Add Merchant"

        fill_in "Name", with: "Namey"
        fill_in "Address", with: "Addy"
        fill_in "City", with: "City"
        fill_in "State", with: "Statey"
        fill_in "Zip", with: "Zippy"

        click_button "Submit"
        expect(current_path).to eq("/merchants")

        expect(page).to have_content("Namey")
        expect(page).to have_content("City")
        expect(page).to have_content("Zippy")
      end
    end
  end
end
