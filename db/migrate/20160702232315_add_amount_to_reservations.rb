class AddAmountToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :amount, :float
  end
end
