class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    include ApplicationHelper


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :role])
    end

    ActionMailer::Base.smtp_settings = {

        :address            => 'smtp.gmail.com',
        :port               => 587,
        :domain             => 'https://flormarketapp.herokuapp.com/', #you can also use google.com
        :authentication     => 'plain',
        :user_name          => ENV['GMAIL_USERNAME'],
        :password           => ENV['GMAIL_PASSWORD'],
        :enable_starttls_auto => true
    }
end

