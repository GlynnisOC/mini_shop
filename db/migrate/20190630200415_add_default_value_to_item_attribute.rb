class AddDefaultValueToItemAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :active, :boolean, :default => true
  end
end
