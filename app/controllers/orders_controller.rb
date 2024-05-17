class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
    set_cart_totals
  end

  def create
    @order = current_user.orders.build(order_params)
    set_cart_totals

    @order.total_price = @total_price
    @order.product_names = @product_names
    @order.cart = @cart

    if @order.save
      @cart.cart_products.destroy_all
      redirect_to orders_path, notice: 'Order was successfully placed.'  # Redirect to index action
    else
      set_cart_totals
      render :new
    end
  end

  def show
    # @order is already set by before_action
  end

  private

  def order_params
    params.require(:order).permit(:address, :payment_method)
  end

  def set_cart
    @cart = current_user.cart
    redirect_to root_path, alert: 'Cart not found.' if @cart.nil?
  end

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def set_cart_totals
    @product_names = @cart.cart_products.map { |cp| cp.product.name }.join(', ')
    @total_price = @cart.cart_products.sum { |cp| cp.product.price * cp.quantity }
  end
end
