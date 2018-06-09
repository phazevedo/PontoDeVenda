class Acquisition < ApplicationRecord
    has_many :acquisition_products
    audited
end
