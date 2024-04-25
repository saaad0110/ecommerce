# app/controllers/cart_products_controller.rb
class CartProductsController < ApplicationController

# Create function--------------------------------------------------------------------------------------------------
def create
  product = Product.find(params[:product_id])
  cart = current_user.cart || current_user.create_cart
   cart_product = cart.cart_products.find_by(product_id: product.id)

  if cart_product
 
    cart_product.update(quantity: cart_product.quantity + params[:quantity].to_i)
  else
    
    cart_product = cart.cart_products.create(product_id: product.id, quantity: params[:quantity].to_i)
  end

  redirect_to cart_path, notice: "#{product.name} added to cart."
end 

#Update function----------------------------------------------------------------------------------------------------
  def update
    cart_product = current_user.cart.cart_products.find(params[:id])
    cart_product.update(quantity: params[:quantity].to_i)
    redirect_to cart_path, notice: 'Cart updated successfully.'
  end
#destroy function----------------------------------------------------------------------------------------------------
  def destroy
    cart_product = current_user.cart.cart_products.find(params[:id])
    cart_product.destroy
    redirect_to cart_path, notice: 'Product removed from cart.'
  end
  
end
