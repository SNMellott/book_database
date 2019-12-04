require 'test_helper'

class BooksIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sara)
    @book = books(:novel)
  end

  test "user index including pagination" do
    log_in_as(@user)
    get books_path
    assert_template 'books/index'
    assert_select 'div.pagination'
    Book.paginate(page: 1).each do |book|
      assert_select 'a[href=?]', book_path(book), text: book.title
    end
  end
end
