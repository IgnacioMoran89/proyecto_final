class Category < ApplicationRecord
    belongs_to :shop_profile
    has_many :products
end
