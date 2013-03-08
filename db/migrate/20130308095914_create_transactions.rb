class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user
      t.references :cart
      t.references :address
      t.references :credit_card

      t.timestamps
    end
    add_index :transactions, :user_id
    add_index :transactions, :cart_id
    add_index :transactions, :address_id
    add_index :transactions, :credit_card_id
  end
end
