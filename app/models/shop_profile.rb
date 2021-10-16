class ShopProfile < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :reviews


end
