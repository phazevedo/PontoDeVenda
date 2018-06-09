class AcquisitionProduct < ApplicationRecord
  belongs_to :product
  audited
end
