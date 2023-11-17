require "application_system_test_case"

class ConsultaGeneralsTest < ApplicationSystemTestCase
  setup do
    @consulta_general = consulta_generals(:one)
  end

  test "visiting the index" do
    visit consulta_generals_url
    assert_selector "h1", text: "Consulta generals"
  end

  test "should create consulta general" do
    visit consulta_generals_url
    click_on "New consulta general"

    fill_in "Descripcion", with: @consulta_general.descripcion
    fill_in "Fecha", with: @consulta_general.fecha
    fill_in "Perro", with: @consulta_general.perro_id
    click_on "Create Consulta general"

    assert_text "Consulta general was successfully created"
    click_on "Back"
  end

  test "should update Consulta general" do
    visit consulta_general_url(@consulta_general)
    click_on "Edit this consulta general", match: :first

    fill_in "Descripcion", with: @consulta_general.descripcion
    fill_in "Fecha", with: @consulta_general.fecha
    fill_in "Perro", with: @consulta_general.perro_id
    click_on "Update Consulta general"

    assert_text "Consulta general was successfully updated"
    click_on "Back"
  end

  test "should destroy Consulta general" do
    visit consulta_general_url(@consulta_general)
    click_on "Destroy this consulta general", match: :first

    assert_text "Consulta general was successfully destroyed"
  end
end
