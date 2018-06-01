class CreateAcquisitions < ActiveRecord::Migration[5.0]
  def change
    create_table :acquisitions do |t|
      t.date :date
      t.decimal :value

      t.timestamps
    end
  end
end
