class Category < ApplicationRecord
    belongs_to :shop_profile
    has_and_belongs_to_many :products
end
