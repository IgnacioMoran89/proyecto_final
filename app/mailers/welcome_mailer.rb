class WelcomeMailer < ActionMailer::Base

    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Bienvenida", from: "miticketvirtual@gmail.com", body: "Estás listo para disfrutar la experiencia FlorMarket"
    end 
end
