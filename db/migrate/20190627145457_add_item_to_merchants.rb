class AddItemToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_reference :merchants, :item, foreign_key: true
  end
end
