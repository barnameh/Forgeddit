require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "can show a form for a new session" do
    get new_session_path
    assert_response :success
  end

  test "can create a session" do
    kaveh = User.create!(name: "Kaveh", password: "kavehIshere")
    post session_path(name: "Kaveh", password: "kavehIshere")
    assert_response :redirect
    assert_equal kaveh.id, session["current_user_id"]
  end

  test "can destroy a session" do
    User.create!(name: "Ari", password: "ariIshere")
    post session_path(name: "Ari", password: "ariIshere")
    delete session_path
    assert_response :redirect
    assert_equal nil, session["current_user_id"]
  end
end
