class House < ActiveRecord::Base
  attr_accessible :bathrooms, :bedrooms, :city, :cost, :housenum, :state, :street, :tenants, :utilities, :zip

  validates :housenum, :presence => true, :length => {:maximum => 10}
  validates :street, :presence => true, :length => {:maximum => 30}
  validates :city, :presence => true, :length => {:maximum => 30} 
  validates :state, :presence => true, :length => {:maximum => 30} 
  validates :zip, :presence => true,:format => {:with => /^\d{5}(?:[-\s]\d{4})?$/} 

  def self.search(search)
    if search  
      find(:all, :conditions => ['bathrooms = ?', search[:bathrooms]])
    end
  end
end

acts_as_gmappable

def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  #  "#{self.street}, #{self.city}, #{self.country}" 
  #  end
end
