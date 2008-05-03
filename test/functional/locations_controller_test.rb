require File.dirname(__FILE__) + '/../test_helper'

class LocationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_location
    assert_difference('Location.count') do
      post :create, :location => { }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  def test_should_show_location
    get :show, :id => locations(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => locations(:one).id
    assert_response :success
  end

  def test_should_update_location
    put :update, :id => locations(:one).id, :location => { }
    assert_redirected_to location_path(assigns(:location))
  end

  def test_should_destroy_location
    assert_difference('Location.count', -1) do
      delete :destroy, :id => locations(:one).id
    end

    assert_redirected_to locations_path
  end
end
