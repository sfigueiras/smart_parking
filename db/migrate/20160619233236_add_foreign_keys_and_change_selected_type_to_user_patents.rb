class AddForeignKeysAndChangeSelectedTypeToUserPatents < ActiveRecord::Migration
  def change
    add_reference :user_patents, :users, index: true
    add_reference :user_patents, :patents, index: true
    change_column :user_patents, :selected, :boolean
  end
end
