class AddGoogleMapsColumns < ActiveRecord::Migration
 def change
    remove_column :users, :latitude,  :float #you can change the name, see wiki
    remove_column :users, :longitude, :float #you can change the name, see wiki
    remove_column :users, :gmaps, :boolean #not mandatory, see wiki

    add_column :houses, :latitude,  :float #you can change the name, see wiki
    add_column :houses, :longitude, :float #you can change the name, see wiki
    add_column :houses, :gmaps, :boolean #not mandatory, see wiki    
  end 
end
