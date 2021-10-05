json.extract! checkout, :id, :message, :signature, :recipient_name, :phone, :address, :city, :florist_instruction, :order_id, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
