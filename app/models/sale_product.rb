class SaleProduct < ApplicationRecord
  belongs_to :product
  audited
end
