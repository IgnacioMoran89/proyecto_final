class ContactsController < ApplicationController
  before_action :contact_params, only: [:create]

  def index
    @contact = ContactForm.new
  end

  def new
    @contact = ContactForm.new
  end 

  def create
    @contact = ContactForm.new(params[:contact_form])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por contactarte con nosotros. Te contactaremos a la brevedad'
      render :index
    else
      flash.now[:error] = 'No se pudo enviar el mensaje'
      render :index
    end
  end

  private
  def contact_params
    params.require(:contact_form).permit(:name, :email, :message, :nickname, :captcha, :florist_name, :phone)
  end
end

