class Address < ActiveRecord::Base

  belongs_to :user

  attr_accessible :address1, :address2, :city, :country, :postcode, :state
end
