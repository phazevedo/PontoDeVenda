class CreateAcquisitionProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :acquisition_products do |t|
      t.references :product, foreign_key: true
      t.references :acquisition, foreign_key: true
      t.decimal :qty
      t.decimal :value

      t.timestamps
    end
  end
end
