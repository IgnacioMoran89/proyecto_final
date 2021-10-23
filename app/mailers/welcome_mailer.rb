class WelcomeMailer < ApplicationMailer

    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Bienvenida", from: "moran.ua@gmail.com"
    end 
end
