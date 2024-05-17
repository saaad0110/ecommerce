class CartsController < ApplicationController
#show function-------------------------------------------------------------------------------
  def show
    @cart = current_user.cart
    @cart_products = @cart.cart_products.includes(:product) if @cart
    
    if params[:cart_product_id].present?
      @cart_product = CartProduct.find_by(id: params[:cart_product_id])
      @cart_product.update(quantity: params[:quantity])    
    end
  end
  def update_quantity
    @cart_product = CartProduct.find(params[:cart_product_id])
    @cart_product.update(quantity: params[:quantity].to_i)
    @total_price = @cart_product.product.price * @cart_product.quantity

    respond_to do |format|
      format.js { render partial: 'update_quantity', layout: false }
      format.html { redirect_to cart_path(@cart_product.cart) }
    end
  end

end