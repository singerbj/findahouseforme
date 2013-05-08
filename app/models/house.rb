class House < ActiveRecord::Base
  acts_as_gmappable
    def gmaps4rails_address
      "#{:housenum} #{:street} #{:city}, #{:state} #{:zip}"
    end
 

  validates :housenum, :presence => true, :length => {:maximum => 10}
  validates :street, :presence => true, :length => {:maximum => 30}
  validates :city, :presence => true, :length => {:maximum => 30} 
  validates :state, :presence => true, :length => {:maximum => 30} 
  validates :zip, :presence => true,:format => {:with => /^\d{5}(?:[-\s]\d{4})?$/} 



  scope :having_bathrooms, lambda {|bathrooms| where("bathrooms = ?", bathrooms)}
  scope :having_bedrooms, lambda {|bedrooms| where("bedrooms = ?", bedrooms)}
  scope :having_street, lambda {|street| where("street LIKE ?", "%#{street}%")}
  scope :having_tentants, lambda {|tenants| where("tenants = ?", tenants)}
  scope :having_cost, lambda {|cost| where("cost <= ?", cost)}
  scope :having_utilities, lambda {|utilities| where("utilities <= ?", utilities)}

  def search(search)
    if search  
      House.having_bathrooms(search[:bathrooms])
    else
      find(:all)  
    end
  end

 

 
  private

  def bathrooms_conditions
      ["bathrooms = ?", search[:bathrooms]] unless bathrooms.blank?
  end

  def bedrooms_conditions
      ["bedrooms = ?", search[:bedrooms]] unless bedrooms.blank?
  end

  def street_conditions
      ["street LIKE ?", "%#{search[:street]}%"] unless street.blank?
  end

  def tenants_conditions
      ["tenants = ?", search[:tenants]] unless tenants.blank?
  end
 
  def cost_conditions
      ["cost <= ?", search[:cost]] unless cost.blank?
  end

  def utilities_conditions
      ["utilities <= ?", search[:utilities]]unless utilities.blank?
  end

  def conditions
      [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
      conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
      conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
      private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
end
