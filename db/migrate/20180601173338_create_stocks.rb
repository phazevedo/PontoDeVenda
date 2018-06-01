class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.references :product, foreign_key: true
      t.decimal :qty
      t.string :action

      t.timestamps
    end
  end
end
