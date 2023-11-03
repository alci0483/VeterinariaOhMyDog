require "application_system_test_case"

class AdopcionsTest < ApplicationSystemTestCase
  setup do
    @adopcion = adopcions(:one)
  end

  test "visiting the index" do
    visit adopcions_url
    assert_selector "h1", text: "Adopcions"
  end

  test "should create adopcion" do
    visit adopcions_url
    click_on "New adopcion"

    fill_in "Edad", with: @adopcion.edad
    fill_in "Nombre", with: @adopcion.nombre
    fill_in "Raza", with: @adopcion.raza
    fill_in "Tamanio", with: @adopcion.tamanio
    fill_in "Ubicacion", with: @adopcion.ubicacion
    click_on "Create Adopcion"

    assert_text "Adopcion was successfully created"
    click_on "Back"
  end

  test "should update Adopcion" do
    visit adopcion_url(@adopcion)
    click_on "Edit this adopcion", match: :first

    fill_in "Edad", with: @adopcion.edad
    fill_in "Nombre", with: @adopcion.nombre
    fill_in "Raza", with: @adopcion.raza
    fill_in "Tamanio", with: @adopcion.tamanio
    fill_in "Ubicacion", with: @adopcion.ubicacion
    click_on "Update Adopcion"

    assert_text "Adopcion was successfully updated"
    click_on "Back"
  end

  test "should destroy Adopcion" do
    visit adopcion_url(@adopcion)
    click_on "Destroy this adopcion", match: :first

    assert_text "Adopcion was successfully destroyed"
  end
end
