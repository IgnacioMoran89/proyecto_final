json.extract! review, :id, :rating, :comment, :user_id, :shop_profile_id, :created_at, :updated_at
json.url review_url(review, format: :json)
