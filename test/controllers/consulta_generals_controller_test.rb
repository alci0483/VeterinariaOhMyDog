require "test_helper"

class ConsultaGeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consulta_general = consulta_generals(:one)
  end

  test "should get index" do
    get consulta_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_consulta_general_url
    assert_response :success
  end

  test "should create consulta_general" do
    assert_difference("ConsultaGeneral.count") do
      post consulta_generals_url, params: { consulta_general: { descripcion: @consulta_general.descripcion, fecha: @consulta_general.fecha, perro_id: @consulta_general.perro_id } }
    end

    assert_redirected_to consulta_general_url(ConsultaGeneral.last)
  end

  test "should show consulta_general" do
    get consulta_general_url(@consulta_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_consulta_general_url(@consulta_general)
    assert_response :success
  end

  test "should update consulta_general" do
    patch consulta_general_url(@consulta_general), params: { consulta_general: { descripcion: @consulta_general.descripcion, fecha: @consulta_general.fecha, perro_id: @consulta_general.perro_id } }
    assert_redirected_to consulta_general_url(@consulta_general)
  end

  test "should destroy consulta_general" do
    assert_difference("ConsultaGeneral.count", -1) do
      delete consulta_general_url(@consulta_general)
    end

    assert_redirected_to consulta_generals_url
  end
end
