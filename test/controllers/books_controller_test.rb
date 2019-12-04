require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sara)
    @other_user = (:archer)
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

  test "should redirect book destroy when not logged in" do
    assert_no_difference 'Book.count' do
      delete book_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect book destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Book.count' do
      delete book_path(@user)
    end
    assert_redirected_to root_url
  end

end
