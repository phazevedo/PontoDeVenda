class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :value
      t.decimal :cost_value

      t.timestamps
    end
  end
end
