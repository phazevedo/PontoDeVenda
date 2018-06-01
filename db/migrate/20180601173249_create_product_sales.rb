class CreateProductSales < ActiveRecord::Migration[5.0]
  def change
    create_table :product_sales do |t|
      t.references :product, foreign_key: true
      t.decimal :qty
      t.decimal :value

      t.timestamps
    end
  end
end
