class AddUserRefToShops < ActiveRecord::Migration[7.1]
  def change
    add_reference :shops, :user, null: true, foreign_key: true
  end
end
