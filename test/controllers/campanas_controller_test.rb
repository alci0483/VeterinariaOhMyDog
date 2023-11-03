require "test_helper"

class CampanasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campana = campanas(:one)
  end

  test "should get index" do
    get campanas_url
    assert_response :success
  end

  test "should get new" do
    get new_campana_url
    assert_response :success
  end

  test "should create campana" do
    assert_difference("Campana.count") do
      post campanas_url, params: { campana: { dni_titular_responsable: @campana.dni_titular_responsable, monto: @campana.monto, nombre_campana: @campana.nombre_campana, objetivo: @campana.objetivo } }
    end

    assert_redirected_to campana_url(Campana.last)
  end

  test "should show campana" do
    get campana_url(@campana)
    assert_response :success
  end

  test "should get edit" do
    get edit_campana_url(@campana)
    assert_response :success
  end

  test "should update campana" do
    patch campana_url(@campana), params: { campana: { dni_titular_responsable: @campana.dni_titular_responsable, monto: @campana.monto, nombre_campana: @campana.nombre_campana, objetivo: @campana.objetivo } }
    assert_redirected_to campana_url(@campana)
  end

  test "should destroy campana" do
    assert_difference("Campana.count", -1) do
      delete campana_url(@campana)
    end

    assert_redirected_to campanas_url
  end
end
