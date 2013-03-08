class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  belongs_to :address
  belongs_to :credit_card
  # attr_accessible :title, :body
end
