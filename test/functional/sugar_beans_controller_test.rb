require 'test_helper'

class SugarBeansControllerTest < ActionController::TestCase
  # TODO: Figure out how to test the root route
  
  test "should get accounts#list" do
    get(:list, {:module => "accounts"})
    assert_response :success
  end
  
  test "should get users/1" do
    get(:show, {:module => "users", :id => "1"})
    assert_equal SugarCRM::User.find(1), assigns(@bean)["bean"]
    assert_response :success
  end
  
  test "should display available modules" do
    get(:list, {:module => "kittens"})
    assert_response :success
  end
  
end
