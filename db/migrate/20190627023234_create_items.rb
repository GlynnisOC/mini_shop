class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :image
      t.boolean :active
      t.integer :inventory
      t.references :merchant

      t.timestamps
    end
  end
end
