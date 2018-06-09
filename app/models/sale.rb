class Sale < ApplicationRecord
    has_many :sale_products
    audited
end
