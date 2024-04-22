class UserCartsController < ApplicationController
  def show
    @user_cart = current_user.user_cart
  end

  def add_to_cart
    product_id = params[:product_id]
    user_cart = current_user.user_cart
    user_cart.products << Product.find(product_id)
    redirect_to user_cart_path(user_cart)
  end

  private

  def current_user
    # Implement your method to retrieve the current user
    # For example:
    @current_user ||= User.find(session[:user_id])
  end

  def add_to_cart
    product_id = params[:product_id]
    user_cart = current_user.user_cart
    user_cart.products << Product.find(product_id)
    redirect_to user_cart_path(user_cart), notice: "Product added to cart successfully!"
  end
end
