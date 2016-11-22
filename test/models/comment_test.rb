require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create a comment" do
    lisa = User.create!(name: "Lisa", password: "lisaIshere")
    bob = User.create!(name: "Bob", password: "bobIshere")
    lisa_link = Link.create!(url: "cmbm.org", user_id: lisa.id)
    lisa_link_comment = Comment.new(text: "should read more", link_id: lisa_link.id, user_id: bob.id)
    assert lisa_link_comment.save!
  end

  test "text is required" do
    lena = User.create!(name: "Lena", password: "lenaIshere")
    bill = User.create!(name: "Bill", password: "billIshere")
    lena_link = Link.create!(url: "cmbm.org", user_id: lena.id)
    lena_link_comment = Comment.new(link_id: lena_link.id, user_id: bill.id)
    assert_not lena_link_comment.save
  end
end
