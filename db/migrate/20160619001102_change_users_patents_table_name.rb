class ChangeUsersPatentsTableName < ActiveRecord::Migration
  def change
    rename_table :users_patents, :patents_users
  end
end
