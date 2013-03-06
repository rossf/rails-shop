class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :products, :through => :cart_items
  has_one :credit_card

  attr_accessible :products, :user
end
