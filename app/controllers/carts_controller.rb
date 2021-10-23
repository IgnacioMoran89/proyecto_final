class CartsController < ApplicationController

    def show
        @order_items = current_order.order_items 
        @order = current_order

    end

    def create
      @orders = Order.pluck :id

    end


    def pay_with_paypal
      order = helpers.current_order
      price = order.subtotal
      response = EXPRESS_GATEWAY.setup_purchase(price,
      ip: request.remote_ip,
      return_url: process_paypal_payment_cart_url,
      cancel_return_url: root_url,
      allow_guest_checkout: true,
      currency: "USD"
      )
      
      payment_method = PaymentMethod.find_by(code: "PEC")
      Payment.create!(
      order_id: order.id,
      payment_method_id: payment_method.id,
      state: "processing",
      total: order.subtotal,
      token: response.token
      
      )

      
      # redirigimos al usuario a Paypal, para que realice el pago
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    end

    def process_paypal_payment
      details = EXPRESS_GATEWAY.details_for(params[:token])
      express_purchase_options =
      {
      ip: request.remote_ip,
      token: params[:token],
      payer_id: details.payer_id,
      currency: "USD"
      
      }
      price = details.params["order_total"].to_d * 100
      response = EXPRESS_GATEWAY.purchase(price, express_purchase_options)
      
      if response.success?

        payment = Payment.find_by(token: response.token)
        order = payment.order
        checkout = payment.checkout
        order.state = 'completed'
        payment.state = 'completed'

        ActiveRecord::Base.transaction do
          order.save!
          payment.save!
        end
        redirect_to root_url, notice: "Compra Exitosa"
      else
        redirect_to root_url, alert: "Hemos tenido problemas para procesar tu pago"
      end
    end

    private

    def order_params
      params.require(:order_item).permit(:quantity, :product_id, :user_id)
    end

    def payment_params
      params.require(:payment).permit(:token, :state, :total, :checkout_id)
    end


    
end
