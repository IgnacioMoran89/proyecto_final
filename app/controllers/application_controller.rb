class ApplicationController < ActionController::Base
    #before_action :configure_permitted_parameters, if: :devise_controller?

    def current_order
      if current_user
        order = Order.find_or_create_by(user_id: current_user.id, state: "created")
      end
    end

    #protected

    #def configure_permitted_parameters
        #devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :role])
    #end
end

