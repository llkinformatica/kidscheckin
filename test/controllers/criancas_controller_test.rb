require "test_helper"

class CriancasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crianca = criancas(:one)
  end

  test "should get index" do
    get criancas_url
    assert_response :success
  end

  test "should get new" do
    get new_crianca_url
    assert_response :success
  end

  test "should create crianca" do
    assert_difference("Crianca.count") do
      post criancas_url, params: { crianca: { nascimento: @crianca.nascimento, nome: @crianca.nome, observacoes: @crianca.observacoes, uid: @crianca.uid } }
    end

    assert_redirected_to crianca_url(Crianca.last)
  end

  test "should show crianca" do
    get crianca_url(@crianca)
    assert_response :success
  end

  test "should get edit" do
    get edit_crianca_url(@crianca)
    assert_response :success
  end

  test "should update crianca" do
    patch crianca_url(@crianca), params: { crianca: { nascimento: @crianca.nascimento, nome: @crianca.nome, observacoes: @crianca.observacoes, uid: @crianca.uid } }
    assert_redirected_to crianca_url(@crianca)
  end

  test "should destroy crianca" do
    assert_difference("Crianca.count", -1) do
      delete crianca_url(@crianca)
    end

    assert_redirected_to criancas_url
  end
end
