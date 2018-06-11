class SaleProduct < ApplicationRecord
  belongs_to :product
  belongs_to :sale
  audited
end
