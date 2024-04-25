class Product < ApplicationRecord
  belongs_to :shop
  has_one_attached :photo
  has_many :cart_products
  has_many :carts, through: :cart_products

  
end
