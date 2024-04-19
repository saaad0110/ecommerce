class ShopsController < ApplicationController
  before_action :authenticate_user!

  def news
    # Check if the current user already has a shop
    if current_user.has_shop?
      redirect_to current_user.shop # Assuming current_user.shop returns the shop object
    else
      @shop = Shop.new
    end
  end
  def show
    @shop=Shop.find(params[:id])
  end

  def create
    @shop = current_user.build_shop(shop_params)
    @shop.id = params[:shop_id]
    if @shop.save
      redirect_to shop_path(@shop), notice: 'Shop created successfully.'
    else
      render :new
    end
  end


  private

  def shop_params
    params.require(:shop).permit(:shop_name) # Add other attributes as needed
  end
end
