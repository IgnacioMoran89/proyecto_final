class ContactForm < MailForm::Base
    attributes :name,  :validate => true
    attributes :florist_name,  :validate => true
    attributes :phone,  :validate => true
    attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attributes :message
    attribute :nickname,  :captcha  => true

    def headers
      {
          :subject => "Contacto de Florería",
          :to => "miticketvirtual@gmail.com",
          :from => %("#{name}" <#{email}>)
      }
    end
  end