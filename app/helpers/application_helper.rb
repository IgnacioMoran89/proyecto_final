module ApplicationHelper

    def current_order
        if !session[:order_id].nil?
            Order.find(session[:order_id])
            
        else
            Order.new
        end
    end
end

#(checkout.order_id == current_order.id) %>