
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
 
  before_action :set_cart_product, only: [:update, :destroy]

  def update
    
    
    
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(quantity: params[:cart_product][:quantity]) 
   
    
    if params[:operation] == 'increase'
      @cart_product.quantity += 1
    elsif params[:operation] == 'decrease'
      @cart_product.quantity -= 1 if @cart_product.quantity > 1 
    end
  
    
    if @cart_product.save
      redirect_to cart_path
    else
      redirect_to cart_path, alert: 'Failed to update product quantity.'
    end
  end

  
  def destroy
    if @cart_product.destroy
      redirect_to cart_path, notice: 'Product removed from cart.'
    else
      redirect_to cart_path, alert: 'Failed to remove product from cart.'
    end
  end

  private

  
  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end

 
  def set_cart_product
    @cart_product = CartProduct.find(params[:id])
  end
  
end
