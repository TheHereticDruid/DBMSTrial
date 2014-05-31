require 'test_helper'

class GameListsControllerTest < ActionController::TestCase
  setup do
    @game_list = game_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_list" do
    assert_difference('GameList.count') do
      post :create, game_list: { crit: @game_list.crit, dev: @game_list.dev, esrb: @game_list.esrb, name: @game_list.name, pub: @game_list.pub, yor: @game_list.yor }
    end

    assert_redirected_to game_list_path(assigns(:game_list))
  end

  test "should show game_list" do
    get :show, id: @game_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_list
    assert_response :success
  end

  test "should update game_list" do
    patch :update, id: @game_list, game_list: { crit: @game_list.crit, dev: @game_list.dev, esrb: @game_list.esrb, name: @game_list.name, pub: @game_list.pub, yor: @game_list.yor }
    assert_redirected_to game_list_path(assigns(:game_list))
  end

  test "should destroy game_list" do
    assert_difference('GameList.count', -1) do
      delete :destroy, id: @game_list
    end

    assert_redirected_to game_lists_path
  end
end
