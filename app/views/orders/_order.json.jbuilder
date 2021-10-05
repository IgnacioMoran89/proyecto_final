json.extract! order, :id, :number, :total, :state, :user_id, :shop_profile_id, :created_at, :updated_at
json.url order_url(order, format: :json)
