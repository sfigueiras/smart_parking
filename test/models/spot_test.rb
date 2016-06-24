require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  test "is_free_as_default" do
    assert_equal spots(:la_plata_1).state, 'Libre'
  end
end
