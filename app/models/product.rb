class Product < ApplicationRecord
  belongs_to :shop
  has_one_attached :photo
  has_many :user_carts, through: :User_Cart_Products
end
