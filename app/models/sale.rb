class Sale < ApplicationRecord
    has_many :sale_products
    belongs_to :client
    audited
end
