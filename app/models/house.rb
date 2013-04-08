class House < ActiveRecord::Base
  attr_accessible :bathrooms, :bedrooms, :city, :cost, :housenum, :state, :street, :tenants, :utilities, :zip

  validates :housenum, :presence => true, :length => {:maximum => 10}
  validates :street, :presence => true, :length => {:maximum => 30}
  validates :city, :presence => true, :length => {:maximum => 30} 
  validates :state, :presence => true, :length => {:maximum => 30} 
  validates :zip, :presence => true,:format => {:with => /^\d{5}(?:[-\s]\d{4})?$/} 
end
