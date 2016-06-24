class AddUserAndSpotReferenceToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :user, index: true, foreign_key: true
    add_reference :reservations, :spot, index: true, foreign_key: true
  end
end
