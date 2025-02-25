require "application_system_test_case"

class MedicaosTest < ApplicationSystemTestCase
  setup do
    @medicao = medicaos(:one)
  end

  test "visiting the index" do
    visit medicaos_url
    assert_selector "h1", text: "Medicaos"
  end

  test "creating a Medicao" do
    visit medicaos_url
    click_on "New Medicao"

    fill_in "Consumo total", with: @medicao.consumo_total
    fill_in "Data", with: @medicao.data
    fill_in "Manha", with: @medicao.manha
    fill_in "Tarde", with: @medicao.tarde
    fill_in "User", with: @medicao.user_id
    click_on "Create Medicao"

    assert_text "Medicao was successfully created"
    click_on "Back"
  end

  test "updating a Medicao" do
    visit medicaos_url
    click_on "Edit", match: :first

    fill_in "Consumo total", with: @medicao.consumo_total
    fill_in "Data", with: @medicao.data
    fill_in "Manha", with: @medicao.manha
    fill_in "Tarde", with: @medicao.tarde
    fill_in "User", with: @medicao.user_id
    click_on "Update Medicao"

    assert_text "Medicao was successfully updated"
    click_on "Back"
  end

  test "destroying a Medicao" do
    visit medicaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medicao was successfully destroyed"
  end
end
