require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get links_path
    assert_response :success
  end

  test "can show a form for a new link" do
    User.create!(name: "Neda", password: "nedaIshere")
    post session_path(name: "Neda", password: "nedaIshere")
    get new_link_path(user_id: session["current_user_id"])
    assert_response :success
  end

  test "can create a link by current user" do
    User.create!(name: "Sam", password: "samIshere")
    post session_path(name: "Sam", password: "samIshere")
    post links_path(link: { url: "www.dclibrary.org" })
    assert_response :redirect
    assert_equal Link.last.url, "www.dclibrary.org"
  end
end
