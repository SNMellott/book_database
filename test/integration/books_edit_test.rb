require 'test_helper'

class BooksEditTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:novel)
    @user = users(:sara)
  end

  test "unsuccessful book edit" do
    log_in_as(@user)
    get edit_book_path(@book)
    assert_template 'books/edit'
    patch book_path(@book), params: {book: {title: "",
                                             author: ""}}
    assert_template 'books/edit'
  end

  test "successful book edit" do
    log_in_as(@user)
    get edit_book_path(@book)
    assert_template 'books/edit'
    title = "Example Book"
    author = "Example Author"
    patch book_path(@book), params: {book: {title: title,
                                            author: author}}
    assert_not flash.empty?
    assert_redirected_to @book
    @book.reload
    assert_equal title, @book.title
    assert_equal author, @book.author
  end
end
