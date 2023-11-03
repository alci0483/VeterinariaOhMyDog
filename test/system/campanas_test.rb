require "application_system_test_case"

class CampanasTest < ApplicationSystemTestCase
  setup do
    @campana = campanas(:one)
  end

  test "visiting the index" do
    visit campanas_url
    assert_selector "h1", text: "Campanas"
  end

  test "should create campana" do
    visit campanas_url
    click_on "New campana"

    fill_in "Dni titular responsable", with: @campana.dni_titular_responsable
    fill_in "Monto", with: @campana.monto
    fill_in "Nombre campana", with: @campana.nombre_campana
    fill_in "Objetivo", with: @campana.objetivo
    click_on "Create Campana"

    assert_text "Campana was successfully created"
    click_on "Back"
  end

  test "should update Campana" do
    visit campana_url(@campana)
    click_on "Edit this campana", match: :first

    fill_in "Dni titular responsable", with: @campana.dni_titular_responsable
    fill_in "Monto", with: @campana.monto
    fill_in "Nombre campana", with: @campana.nombre_campana
    fill_in "Objetivo", with: @campana.objetivo
    click_on "Update Campana"

    assert_text "Campana was successfully updated"
    click_on "Back"
  end

  test "should destroy Campana" do
    visit campana_url(@campana)
    click_on "Destroy this campana", match: :first

    assert_text "Campana was successfully destroyed"
  end
end
