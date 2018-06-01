class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.date :date
      t.decimal :value

      t.timestamps
    end
  end
end
