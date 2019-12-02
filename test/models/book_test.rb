require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @book = Book.new(title: "Example Title", author: "Sample Author")
  end

  test "should be valid book" do
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = "      "
    assert_not @book.valid?
  end

  test "author should be present" do
    @book.author = "     "
    assert_not @book.valid?
  end

  test "title should be unique" do
    duplicate_book = @book.dup
    @book.save
    assert_not duplicate_book.valid?
  end

  test "title should be present (nonblank)" do
    @book.title = " " * 2
    assert_not @book.valid?
  end

  test "author should be present (nonblank)" do
    @book.author = " " * 2
    assert_not @book.valid?
  end
end
