json.extract! product_sale, :id, :product_id, :qty, :value, :created_at, :updated_at
json.url product_sale_url(product_sale, format: :json)
