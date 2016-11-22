require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "can show a form for a new user" do
    get new_user_path
    assert_response :success
  end

  test "can create a user" do
    post users_path(user: { name: "Ava", password: "avaIshere" })
    assert_response :redirect
    assert_equal "Ava", User.last.name
  end
end
