class OrdersController < ApplicationController
    before_action :set_order, only: %i[ show edit update destroy ]
    def new
        @products = Product.all
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
