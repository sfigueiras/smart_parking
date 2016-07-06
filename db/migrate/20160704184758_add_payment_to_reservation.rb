class AddPaymentToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :payment, index: true, foreign_key: true
  end
end
