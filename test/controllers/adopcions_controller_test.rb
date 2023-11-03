require "test_helper"

class AdopcionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adopcion = adopcions(:one)
  end

  test "should get index" do
    get adopcions_url
    assert_response :success
  end

  test "should get new" do
    get new_adopcion_url
    assert_response :success
  end

  test "should create adopcion" do
    assert_difference("Adopcion.count") do
      post adopcions_url, params: { adopcion: { edad: @adopcion.edad, nombre: @adopcion.nombre, raza: @adopcion.raza, tamanio: @adopcion.tamanio, ubicacion: @adopcion.ubicacion } }
    end

    assert_redirected_to adopcion_url(Adopcion.last)
  end

  test "should show adopcion" do
    get adopcion_url(@adopcion)
    assert_response :success
  end

  test "should get edit" do
    get edit_adopcion_url(@adopcion)
    assert_response :success
  end

  test "should update adopcion" do
    patch adopcion_url(@adopcion), params: { adopcion: { edad: @adopcion.edad, nombre: @adopcion.nombre, raza: @adopcion.raza, tamanio: @adopcion.tamanio, ubicacion: @adopcion.ubicacion } }
    assert_redirected_to adopcion_url(@adopcion)
  end

  test "should destroy adopcion" do
    assert_difference("Adopcion.count", -1) do
      delete adopcion_url(@adopcion)
    end

    assert_redirected_to adopcions_url
  end
end
