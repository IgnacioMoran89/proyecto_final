json.extract! payment, :id, :token, :state, :total, :checkout_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
