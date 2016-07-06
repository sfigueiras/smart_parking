class AddPatentToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :patent, index: true, foreign_key: true
  end
end
