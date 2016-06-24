require 'test_helper'

class AreasControllerTest < ActionController::TestCase
  def after_setup
    @user = users(:carlos)
    sign_in @user
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
end
