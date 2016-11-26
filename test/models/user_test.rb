require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create a new user" do
    john = User.new(name: "John", password: "johnIshere")
    assert john.save!
  end

  test "name is required" do
    john = User.new(password: "johnIshere")
    assert_not john.save
  end

  test "password is required" do
    adam = User.new(name: "Adam")
    assert_not adam.save
  end

  test "name should be unique" do
    User.create!(name: "Peter", password: "johnIshere")
    peter = User.new(name: "Peter", password: "johnWashere")
    assert_not peter.save
  end

  test "can get posted links" do
    kathy = User.create!(name: "kathy", password: "cathyIshere")
    Link.create!(url: "www.dclibrary.org", user_id: kathy.id)
    Link.create!(url: "www.cmbm.org", user_id: kathy.id)
    assert_equal 2, kathy.links.count
  end
end
