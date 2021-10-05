json.extract! shop_profile, :id, :name, :phone, :rating, :comment, :address, :description, :user_id, :created_at, :updated_at
json.url shop_profile_url(shop_profile, format: :json)
