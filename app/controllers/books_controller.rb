class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book added to the Database!"
      redirect_to @book
    else
      render 'new'
    end
  end

  def index
  end

private

  def book_params
    params.require(:book).permit(:title, :author)
  end

end
