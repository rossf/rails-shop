class AddTokenToCreditCard < ActiveRecord::Migration
  def change
    add_column :credit_cards, :card_token, :string
  end
end
