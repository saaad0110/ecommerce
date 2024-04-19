class UserCartProduct < ApplicationRecord
  belongs_to :products
  belongs_to :user_carts
end
