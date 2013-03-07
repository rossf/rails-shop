class Address < ActiveRecord::Base

  belongs_to :user
  validates_associated :user

  attr_accessible :address1, :address2, :city, :country, :postcode, :state

  validates :address1, :city, :country, :presence => true
end
