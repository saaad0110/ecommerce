class Cart < ApplicationRecord
  
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products
  has_many :orders, dependent: :destroy
end
