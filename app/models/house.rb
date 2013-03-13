class House < ActiveRecord::Base
  attr_accessible :bathrooms, :bedrooms, :city, :cost, :housenum, :state, :street, :tenants, :utilities, :zip
end
