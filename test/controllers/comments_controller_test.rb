require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get comments for given user" do
    ted = User.create!(name: "Ted", password: "tedIshere")
    norm = User.create!(name: "Norm", password: "normIshere")
    ted_link = Link.create!(url: "www.dclibrary.org", user_id: ted.id)
    Comment.create!(text: "use it!", link_id: ted_link.id, user_id: norm.id)
    get user_comments_path(user_id: norm.id)
    assert_response :success
  end

  test "should get comments for given link" do
    ted = User.create!(name: "Ted", password: "tedIshere")
    norm = User.create!(name: "Norm", password: "normIshere")
    ted_link = Link.create!(url: "www.dclibrary.org", user_id: ted.id)
    Comment.create!(text: "use it!", link_id: ted_link.id, user_id: norm.id)
    get link_comments_path(link_id: ted_link.id)
    assert_response :success
  end

  test "should show form for new comment for given link" do
    User.create!(name: "Norm", password: "normIshere")
    post session_path(name: "Norm", password: "normIshere")
    ted = User.create!(name: "Ted", password: "tedIshere")
    ted_link = Link.create!(url: "www.dclibrary.org", user_id: ted.id)
    get new_link_comment_path(link_id: ted_link.id)
    assert_response :success
  end

  test "should create a comment for given link by curren user" do
    User.create!(name: "Norm", password: "normIshere")
    post session_path(name: "Norm", password: "normIshere")
    ted = User.create!(name: "Ted", password: "tedIshere")
    ted_link = Link.create!(url: "www.dclibrary.org", user_id: ted.id)
    post comments_path(comment: { link_id: ted_link.id, text: "They are great!" })
    assert_response :redirect
    assert_equal Comment.last.text, "They are great!"
  end
end
