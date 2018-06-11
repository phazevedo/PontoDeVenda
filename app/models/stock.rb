class Stock < ApplicationRecord

  SALE = "S"
  ACQUISITION = "A"

  belongs_to :product
  audited

  
  def self.generate_sale(prod)
    generate(prod, SALE)
  end
  
  def self.generate_acquisition(prod)
    generate(prod, ACQUISITION)    
  end

  def generate(prod, stock_action)
    create(product_id: prod.product_id, qty: prod.qty, action: stock_action)
  end
end
