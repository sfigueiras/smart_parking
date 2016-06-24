require 'test_helper'

class PatentTest < ActiveSupport::TestCase
  test "invalid_format" do
    patent = Patent.new(number: '456rte')
    refute patent.valid?
  end

  test "is_invalid_without_number" do 
    patent = Patent.new
    refute patent.valid?
  end
end
