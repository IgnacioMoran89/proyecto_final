class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
         after_create :welcome_send

  enum role: [:customer, :client, :admin]
  has_many :reviews, dependent: :destroy
  has_many :orders
  has_many :checkouts
  #Opción de enviar email
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
  end

  def is_admin?
    role == admin!
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      #user.name = auth.info.name
    end 
  end 
end

