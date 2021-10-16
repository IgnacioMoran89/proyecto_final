class Product < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :order_items
end
