class Stock < ApplicationRecord
  belongs_to :product
  audited
end
