class Review < ApplicationRecord
    belongs_to :user
	belongs_to :shop_profile
end
