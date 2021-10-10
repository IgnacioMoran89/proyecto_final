class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:customer, :client, :admin]
  has_many :reviews, dependent: :destroy

  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
