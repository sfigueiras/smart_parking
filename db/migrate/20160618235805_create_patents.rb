class CreatePatents < ActiveRecord::Migration
  def change
    create_table :patents do |t|
      t.string :number, null: false
      t.timestamps null: false
    end

    create_table :patents_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :patent, index: true
    end
  end
end
