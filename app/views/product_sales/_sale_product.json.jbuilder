json.extract! sale_product, :id, :product_id, :qty, :value, :created_at, :updated_at
json.url sale_product_url(sale_product, format: :json)
