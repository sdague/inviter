require File.dirname(__FILE__) + '/../test_helper'

class RsvpsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:rsvps)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_rsvp
    assert_difference('Rsvp.count') do
      post :create, :rsvp => { }
    end

    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  def test_should_show_rsvp
    get :show, :id => rsvps(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => rsvps(:one).id
    assert_response :success
  end

  def test_should_update_rsvp
    put :update, :id => rsvps(:one).id, :rsvp => { }
    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  def test_should_destroy_rsvp
    assert_difference('Rsvp.count', -1) do
      delete :destroy, :id => rsvps(:one).id
    end

    assert_redirected_to rsvps_path
  end
end
