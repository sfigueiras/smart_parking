class AddStateToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :state, :text, default: 'Libre'
  end
end
