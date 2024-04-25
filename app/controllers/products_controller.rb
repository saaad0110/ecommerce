class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    # Assuming current_user represents the logged-in seller and current_user.shop returns the associated shop
shop_id = current_user.shop.id

# Retrieve products belonging to the shop of the logged-in seller
@products = Product.where(shop_id: shop_id)

  end

  # GET /products/new
  def new
    @shop = Shop.find(params[:shop_id])
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    
    @shop = Shop.find(product_params[:shop_id])
    @product = @shop.products.build(product_params)

    if @product.save
      redirect_to @shop, notice: 'Product was successfully created.'
    else
      render 'shops/show'
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :shop_id, :photo)
    end
    def show
      @product = Product.find(params[:id])
      @shop = @product.shop
      
    
      if @shop.nil?
        flash[:error] = "Shop not found for this product."
        redirect_to root_path
        return
      end
      
    end 
    
end
