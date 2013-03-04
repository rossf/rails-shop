require 'fuelable/cardtoken'

class CreditCardsController < ApplicationController

  Fuelable::api_key = 'sb_NzNhODQ3MDEtYmRhMS00ODJhLTk5NGYtY2QyMGVhNWJhYjM4'

  before_filter :authenticate_user!

  # GET /credit_cards
  # GET /credit_cards.json
  def index
    @credit_cards = CreditCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credit_cards }
    end
  end

  # GET /credit_cards/1
  # GET /credit_cards/1.json
  def show
    @credit_card = CreditCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @credit_card }
    end
  end

  # GET /credit_cards/new
  # GET /credit_cards/new.json
  def new
    @credit_card = CreditCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credit_card }
    end
  end

  # GET /credit_cards/1/edit
  def edit
    @credit_card = CreditCard.find(params[:id])
  end

  # POST /credit_cards
  # POST /credit_cards.json
  def create
    card_hash = params[:credit_card]
    expiry_year = card_hash['expiry_date(1i)']
    expiry_month = card_hash['expiry_date(2i)']
    card_hash['expiry_month'] = expiry_month
    card_hash['expiry_year'] = expiry_year
    card_hash.delete('expiry_date(1i)')
    card_hash.delete('expiry_date(2i)')
    card_hash.delete('expiry_date(3i)')
    @credit_card = CreditCard.new(card_hash)
    @credit_card.user = current_user

    cardToken = Fuelable::CardToken.create(@credit_card)

    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to @credit_card, notice: 'Credit card was successfully created.' }
        format.json { render json: @credit_card, status: :created, location: @credit_card }
      else
        format.html { render action: "new" }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /credit_cards/1
  # PUT /credit_cards/1.json
  def update
    @credit_card = CreditCard.find(params[:id])

    respond_to do |format|
      if @credit_card.update_attributes(params[:credit_card])
        format.html { redirect_to @credit_card, notice: 'Credit card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_cards/1
  # DELETE /credit_cards/1.json
  def destroy
    @credit_card = CreditCard.find(params[:id])
    @credit_card.destroy

    respond_to do |format|
      format.html { redirect_to credit_cards_url }
      format.json { head :no_content }
    end
  end
end
