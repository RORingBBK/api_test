require 'test_helper'

class FilmsControllerTest < ActionController::TestCase
  setup do
    @film = films(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:films)
  end

  test "should create film" do
    assert_difference('Film.count') do
      post :create, film: { title: @film.title, year: @film.year }
    end

    assert_response 201
  end

  test "should show film" do
    get :show, id: @film
    assert_response :success
  end

  test "should update film" do
    put :update, id: @film, film: { title: @film.title, year: @film.year }
    assert_response 204
  end

  test "should destroy film" do
    assert_difference('Film.count', -1) do
      delete :destroy, id: @film
    end

    assert_response 204
  end
end
