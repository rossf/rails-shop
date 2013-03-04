class CheckoutsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @credit_card = CreditCard.new
  end
end
