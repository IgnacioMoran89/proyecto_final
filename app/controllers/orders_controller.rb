class OrdersController < ApplicationController
    before_action :set_order, only: %i[ show edit update destroy ]
    def new
        @products = Product.all
    end

    def create
      @order = Order.new(order_params.merge(user_id: current_user.id))
    end

    def my_orders
      @order_item = OrderItem.includes(:orders).find(params[:order_item_id])
      @orders = @order_item.orders
    end
 
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:checkout).permit(:message, :signature, :recipient_name, :phone, :address, :city, :florist_instruction, :order_id)
    end
end
