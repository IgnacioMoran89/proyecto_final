class ProductsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @shop_profiles = ShopProfile.pluck :name, :id, :description, :phone, :address, :rating, :comment
    @shop_profiles = ShopProfile.all 
  end

  # GET /products/1 or /products/1.json
  def show
    @shop_profiles = ShopProfile.pluck :name, :id, :description, :phone, :address, :rating, :comment
    @shop_profiles = ShopProfile.all 
  end

  # GET /products/new
  def new
    @product = Product.new
    @shop_profiles = ShopProfile.pluck :name, :id, :description, :phone, :address, :rating, :comment
    @shop_profiles = ShopProfile.all 
    @users = User.pluck :id #Pluck disponibiliza atributos de otro modelo
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @categories = Category.all
    @shop_profiles = ShopProfile.pluck :name, :id, :description, :phone, :address, :rating, :comment
    @shop_profiles = ShopProfile.all 
    

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :img_url, :shop_profile_id, :user_id, {category_ids: []})
    end
end
