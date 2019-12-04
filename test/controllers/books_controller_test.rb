require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sara)
    @book = books(:novel)
  end

  test "should redirect book index when not logged in" do
    get books_path
    assert_redirected_to login_url
  end

  test "should redirect book edit when not logged in" do
    get edit_book_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
