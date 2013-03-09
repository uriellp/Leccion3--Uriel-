require 'test_helper'

class ControladorControllerTest < ActionController::TestCase
  test "should get ejercicio1" do
    get :ejercicio1
    assert_response :success
  end

end
