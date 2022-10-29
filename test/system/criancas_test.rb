require "application_system_test_case"

class CriancasTest < ApplicationSystemTestCase
  setup do
    @crianca = criancas(:one)
  end

  test "visiting the index" do
    visit criancas_url
    assert_selector "h1", text: "Criancas"
  end

  test "should create crianca" do
    visit criancas_url
    click_on "New crianca"

    fill_in "Nascimento", with: @crianca.nascimento
    fill_in "Nome", with: @crianca.nome
    fill_in "Observacoes", with: @crianca.observacoes
    fill_in "Uid", with: @crianca.uid
    click_on "Create Crianca"

    assert_text "Crianca was successfully created"
    click_on "Back"
  end

  test "should update Crianca" do
    visit crianca_url(@crianca)
    click_on "Edit this crianca", match: :first

    fill_in "Nascimento", with: @crianca.nascimento
    fill_in "Nome", with: @crianca.nome
    fill_in "Observacoes", with: @crianca.observacoes
    fill_in "Uid", with: @crianca.uid
    click_on "Update Crianca"

    assert_text "Crianca was successfully updated"
    click_on "Back"
  end

  test "should destroy Crianca" do
    visit crianca_url(@crianca)
    click_on "Destroy this crianca", match: :first

    assert_text "Crianca was successfully destroyed"
  end
end
