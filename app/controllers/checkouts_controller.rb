class CheckoutsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @cart = Cart.find(params[:cart])
    raise "Invalid user" if @cart.user != current_user
    @credit_card = CreditCard.new
    @address = Address.new
    @billing_address = Address.new
  end
end
