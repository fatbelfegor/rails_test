class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_permit)
    if @book.save
      flash[:success] = "New book added"
      redirect_to book_path(@book)
    else
      flash[:error] = @book.errors.full_messages
      redirect_to new_book_path
    end
  end

  def book_permit
    params.require(:book).permit(:title, :description, :cover_url)
  end
end
