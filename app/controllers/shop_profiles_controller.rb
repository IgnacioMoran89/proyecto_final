class ShopProfilesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_shop_profile, only: %i[ show edit update destroy ]

  # GET /shop_profiles or /shop_profiles.json
  def index
    @shop_profiles = ShopProfile.all
    @products = Product.pluck :id #Pluck disponibiliza atributos de otro modelo
    @order_item = current_order.order_items.new
  end

  # GET /shop_profiles/1 or /shop_profiles/1.json
  def show
    
    @products = Product.pluck :id, :name, :description, :price, :img_url, :shop_profile_id
    @categories = Category.pluck :id, :name
    @products = Product.all
    @order_item = current_order.order_items.new
    @reviews = Review.where(shop_profile_id: @shop_profile.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  # GET /shop_profiles/new
  def new
    @products = Product.pluck :id
    @products = Product.all
    @shop_profile = ShopProfile.new
    @users = User.pluck :id #Pluck disponibiliza atributos de otro modelo
  end

  # GET /shop_profiles/1/edit
  def edit
  end

  # POST /shop_profiles or /shop_profiles.json
  def create
    @products = Product.pluck :id
    @products = Product.all
    @shop_profile = ShopProfile.new(shop_profile_params)

    respond_to do |format|
      if @shop_profile.save
        format.html { redirect_to @shop_profile, notice: "Shop profile was successfully created." }
        format.json { render :show, status: :created, location: @shop_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_profiles/1 or /shop_profiles/1.json
  def update
    respond_to do |format|
      if @shop_profile.update(shop_profile_params)
        format.html { redirect_to @shop_profile, notice: "Shop profile was successfully updated." }
        format.json { render :show, status: :ok, location: @shop_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_profiles/1 or /shop_profiles/1.json
  def destroy
    @shop_profile.destroy
    respond_to do |format|
      format.html { redirect_to shop_profiles_url, notice: "Shop profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_profile
      @shop_profile = ShopProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_profile_params
      params.require(:shop_profile).permit(:name, :phone, :rating, :comment, :address, :description, :user_id, :product_id)
    end
end
