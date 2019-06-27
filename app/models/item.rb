class Item < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :name, :description, :price, :image, :active, :inventory, :merchant_id

  def merchant_name
    id = Merchant.find(merchant_id)
    id.name
  end
end
