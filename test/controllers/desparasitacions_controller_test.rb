require "test_helper"

class DesparasitacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desparasitacion = desparasitacions(:one)
  end

  test "should get index" do
    get desparasitacions_url
    assert_response :success
  end

  test "should get new" do
    get new_desparasitacion_url
    assert_response :success
  end

  test "should create desparasitacion" do
    assert_difference("Desparasitacion.count") do
      post desparasitacions_url, params: { desparasitacion: { dosis: @desparasitacion.dosis, nombre_medicamento: @desparasitacion.nombre_medicamento, perro_id: @desparasitacion.perro_id, tipo_medicamento: @desparasitacion.tipo_medicamento } }
    end

    assert_redirected_to desparasitacion_url(Desparasitacion.last)
  end

  test "should show desparasitacion" do
    get desparasitacion_url(@desparasitacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_desparasitacion_url(@desparasitacion)
    assert_response :success
  end

  test "should update desparasitacion" do
    patch desparasitacion_url(@desparasitacion), params: { desparasitacion: { dosis: @desparasitacion.dosis, nombre_medicamento: @desparasitacion.nombre_medicamento, perro_id: @desparasitacion.perro_id, tipo_medicamento: @desparasitacion.tipo_medicamento } }
    assert_redirected_to desparasitacion_url(@desparasitacion)
  end

  test "should destroy desparasitacion" do
    assert_difference("Desparasitacion.count", -1) do
      delete desparasitacion_url(@desparasitacion)
    end

    assert_redirected_to desparasitacions_url
  end
end
