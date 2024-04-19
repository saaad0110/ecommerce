class CreateUserCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :user_carts do |t|
      t.integer :total_quanity
      t.bigint :total_price
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
