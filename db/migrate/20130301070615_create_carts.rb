class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user
      t.references :cart_item

      t.timestamps
    end
  end
end
