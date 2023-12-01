require "test_helper"

class TurnoNuevoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get turno_nuevo_new_url
    assert_response :success
  end
end
