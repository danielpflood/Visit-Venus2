require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get media" do
    get :media
    assert_response :success
  end

  test "should get forum" do
    get :forum
    assert_response :success
  end

end
