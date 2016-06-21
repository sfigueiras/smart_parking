class CreateUserPatents < ActiveRecord::Migration
  def change
    create_table :user_patents do |t|
      t.string :selected

      t.timestamps null: false
    end

    drop_table :patents_users
  end
end
