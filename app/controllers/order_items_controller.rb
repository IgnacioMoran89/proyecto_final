class OrderItemsController < InheritedResources::Base

  private

    def order_item_params
      params.require(:order_item).permit(:quantity, :total, :unit_price, :product_id, :order_id)
    end

end
