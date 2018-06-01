json.extract! product, :id, :description, :value, :cost_value, :created_at, :updated_at
json.url product_url(product, format: :json)
