class CheckoutsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @transaction = Transaction.new()
    @transaction.user = current_user

    @transaction.address = Address.find(params[:address])
    @transaction.credit_card = CreditCard.find(params[:card])
    if @transaction.save
      render json: @transaction, status: :created, location: {:action => done}
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def start
    @cart = Cart.find(params[:cart])
    raise "Invalid user" if @cart.user != current_user
    @credit_card = CreditCard.new
    @address = Address.new
    @billing_address = Address.new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # start.html.erbrb
      format.json { render json: [@cart, @address, @billing_address, @transaction] }
    end
  end

  def done

  end
end
