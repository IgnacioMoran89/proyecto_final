json.extract! product, :id, :name, :description, :price, :img_url, :shop_profile_id, :created_at, :updated_at
json.url product_url(product, format: :json)
