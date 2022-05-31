require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "#full_name returns the capitalized first name and last name" do
    # setup
    user = User.new(first_name: "john", last_name: "lennon")

    # exercice - verify
    assert_equal "John Lennon", user.full_name
  end
end
