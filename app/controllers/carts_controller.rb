class CartsController < ApplicationController
    before_action :authenticate_user!

    def update
        product = params[:cart][:product_id]
        quantity = params[:cart][:quantity]
        current_order.add_product(product, quantity)
        redirect_to root_path, notice: "Product added successfuly"
    end

    def show
        @order = current_order
    end
end
