class Category < ApplicationRecord
    belongs_to :shop_profile, optional: true
    has_and_belongs_to_many :products
end
