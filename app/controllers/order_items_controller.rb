class OrderItemsController < InheritedResources::Base

  def new
    @checkouts = Checkout.pluck :id
    @products = Product.all
  end 


  
  def create
    @checkouts = Checkout.pluck :id
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @order.save
    session[:order_id] = @order.id

    respond_to do |format|
      format.js {redirect_to cart_url} 
    end 
end



def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items
end

def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
end

private

    def order_params
      params.require(:order_item).permit(:quantity, :product_id, :user_id)
    end

end
