require "test_helper"

class GeneradorMotivoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get generador_motivo_new_url
    assert_response :success
  end

  test "should get create" do
    get generador_motivo_create_url
    assert_response :success
  end
end
