class UserCart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :products, through: :User_Cart_Products
end
