class AddSelectedAttributeToPatent < ActiveRecord::Migration
  def change
    add_column :patents_users, :selected, :boolean
  end
end
