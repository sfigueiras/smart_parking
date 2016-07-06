class AddEndsAtToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :ends_at, :datetime
  end
end
