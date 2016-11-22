require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create a link" do
    johnny = User.create!(name: "Johnny", password: "johnnyIshere")
    johnny_link = Link.new(url: "cmbm.org", user_id: johnny.id)
    assert johnny_link.save!
  end

  test "url is required" do
    jim = User.create!(name: "Jim", password: "jimIshere")
    jim_link = Link.new(user_id: jim.id)
    assert_not jim_link.save
  end

  test "can get posted comments" do
    jimmy = User.create!(name: "Jimmyy", password: "jimmyIshere")
    mary = User.create!(name: "Mary", password: "maryIshere")
    mona = User.create!(name: "Mona", password: "monaIshere")
    jimmy_link = Link.create!(url: "www.cmbm.org", user_id: jimmy.id)
    Comment.create!(text: "good advice", link_id: jimmy_link.id, user_id: mary.id)
    Comment.create!(text: "greate help!", link_id: jimmy_link.id, user_id: mona.id)
    assert_equal 2, jimmy_link.comments.count
  end
end
