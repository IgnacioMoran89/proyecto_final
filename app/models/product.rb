class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop_profile
  has_and_belongs_to_many :categories
  has_many :order_items
end
