class AddCreditCardToCart < ActiveRecord::Migration
  def change
    add_column :carts, :credit_card_id, :integer
  end
end
