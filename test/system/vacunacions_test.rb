require "application_system_test_case"

class VacunacionsTest < ApplicationSystemTestCase
  setup do
    @vacunacion = vacunacions(:one)
  end

  test "visiting the index" do
    visit vacunacions_url
    assert_selector "h1", text: "Vacunacions"
  end

  test "should create vacunacion" do
    visit vacunacions_url
    click_on "New vacunacion"

    fill_in "Dosis", with: @vacunacion.dosis
    fill_in "Marca vacuna", with: @vacunacion.marca_vacuna
    fill_in "Numero lote", with: @vacunacion.numero_lote
    fill_in "Tipo vacuna", with: @vacunacion.tipo_vacuna
    click_on "Create Vacunacion"

    assert_text "Vacunacion was successfully created"
    click_on "Back"
  end

  test "should update Vacunacion" do
    visit vacunacion_url(@vacunacion)
    click_on "Edit this vacunacion", match: :first

    fill_in "Dosis", with: @vacunacion.dosis
    fill_in "Marca vacuna", with: @vacunacion.marca_vacuna
    fill_in "Numero lote", with: @vacunacion.numero_lote
    fill_in "Tipo vacuna", with: @vacunacion.tipo_vacuna
    click_on "Update Vacunacion"

    assert_text "Vacunacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacunacion" do
    visit vacunacion_url(@vacunacion)
    click_on "Destroy this vacunacion", match: :first

    assert_text "Vacunacion was successfully destroyed"
  end
end
