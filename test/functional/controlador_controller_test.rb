require 'test_helper'

class ControladorControllerTest < ActionController::TestCase
  test "should get ejercicio2" do
    get :ejercicio2
    assert_response :success
  end

end
