class ChangeUserPatentsForeignKeysNames < ActiveRecord::Migration
  def change
    rename_column :user_patents, :users_id, :user_id
    rename_column :user_patents, :patents_id, :patent_id
  end
end
