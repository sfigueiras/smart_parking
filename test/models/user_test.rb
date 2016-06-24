require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user_cant_make_more_than_one_reservation" do
    user = users(:jorge)

    reservation = user.reservations.new(spot_id: spots(:la_plata_1).id)

    refute reservation.valid?
    
    reservation.save
    user.reload

    assert_equal 1, user.reservations.size
  end
end
