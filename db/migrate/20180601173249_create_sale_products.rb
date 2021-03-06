class CreateSaleProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_products do |t|
      t.references :product, foreign_key: true
      t.references :sale, foreign_key: true
      t.decimal :qty
      t.decimal :value

      t.timestamps
    end
  end
end
