class AddStartAtToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :start_at, :datetime
  end
end
