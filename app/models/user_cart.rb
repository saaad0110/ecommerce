class UserCart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :products, through: :User_Cart_Products
  has_many :user_cart_products, dependent: :destroy
end
