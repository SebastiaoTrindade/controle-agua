require 'test_helper'

class MedicaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medicao = medicaos(:one)
  end

  test "should get index" do
    get medicaos_url
    assert_response :success
  end

  test "should get new" do
    get new_medicao_url
    assert_response :success
  end

  test "should create medicao" do
    assert_difference('Medicao.count') do
      post medicaos_url, params: { medicao: { consumo_total: @medicao.consumo_total, data: @medicao.data, manha: @medicao.manha, tarde: @medicao.tarde, user_id: @medicao.user_id } }
    end

    assert_redirected_to medicao_url(Medicao.last)
  end

  test "should show medicao" do
    get medicao_url(@medicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_medicao_url(@medicao)
    assert_response :success
  end

  test "should update medicao" do
    patch medicao_url(@medicao), params: { medicao: { consumo_total: @medicao.consumo_total, data: @medicao.data, manha: @medicao.manha, tarde: @medicao.tarde, user_id: @medicao.user_id } }
    assert_redirected_to medicao_url(@medicao)
  end

  test "should destroy medicao" do
    assert_difference('Medicao.count', -1) do
      delete medicao_url(@medicao)
    end

    assert_redirected_to medicaos_url
  end
end
