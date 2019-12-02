require 'test_helper'

class AddNewBookTest < ActionDispatch::IntegrationTest

  test "invalid book information" do
    get newbook_path
    assert_no_difference 'Book.count' do
      post books_path, params: {book: {title: "",
                                       author: ""}}
    end
    assert_template 'books/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
end
