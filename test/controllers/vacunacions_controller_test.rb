require "test_helper"

class VacunacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacunacion = vacunacions(:one)
  end

  test "should get index" do
    get vacunacions_url
    assert_response :success
  end

  test "should get new" do
    get new_vacunacion_url
    assert_response :success
  end

  test "should create vacunacion" do
    assert_difference("Vacunacion.count") do
      post vacunacions_url, params: { vacunacion: { dosis: @vacunacion.dosis, marca_vacuna: @vacunacion.marca_vacuna, numero_lote: @vacunacion.numero_lote, tipo_vacuna: @vacunacion.tipo_vacuna } }
    end

    assert_redirected_to vacunacion_url(Vacunacion.last)
  end

  test "should show vacunacion" do
    get vacunacion_url(@vacunacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacunacion_url(@vacunacion)
    assert_response :success
  end

  test "should update vacunacion" do
    patch vacunacion_url(@vacunacion), params: { vacunacion: { dosis: @vacunacion.dosis, marca_vacuna: @vacunacion.marca_vacuna, numero_lote: @vacunacion.numero_lote, tipo_vacuna: @vacunacion.tipo_vacuna } }
    assert_redirected_to vacunacion_url(@vacunacion)
  end

  test "should destroy vacunacion" do
    assert_difference("Vacunacion.count", -1) do
      delete vacunacion_url(@vacunacion)
    end

    assert_redirected_to vacunacions_url
  end
end
