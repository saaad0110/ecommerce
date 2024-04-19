class CreateUserCartProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :user_cart_products do |t|
      t.references :products, null: false, foreign_key: true
      t.references :user_carts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
