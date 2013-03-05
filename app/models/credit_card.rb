class CreditCard < ActiveRecord::Base
  belongs_to :user

  attr_accessor :number, :cvc, :expiry_date

  attr_accessible :expiry_month, :expiry_year, :name_on_card, :cvc, :number, :card_token, :expiry_date

end
