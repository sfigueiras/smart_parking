class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :number
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
