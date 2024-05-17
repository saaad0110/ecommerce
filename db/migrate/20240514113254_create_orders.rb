class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.string :address
      t.text :product_names
      t.text :payment_method
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
