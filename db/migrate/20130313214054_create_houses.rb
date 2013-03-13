class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :housenum
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :bathrooms
      t.integer :tenants
      t.integer :bedrooms
      t.integer :cost
      t.integer :utilities

      t.timestamps
    end
  end
end
