# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  before_action :authenticate_user!
#show function-------------------------------------------------------------------------------
  def show
    @cart = current_user.cart
    @cart_products = @cart.cart_products.includes(:product) if @cart
  end
end
