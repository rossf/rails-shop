class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :expiry_month
      t.integer :expiry_year
      t.string :name_on_card
      t.references :user

      t.timestamps
    end
  end
end
