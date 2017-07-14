class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = "New book added"
      redirect_to book_path(@book)
    else
      flash[:error] = @book.errors.full_messages
      redirect_to new_book_path
    end
  end

  def update
    if @book.update_attributes(book_params)
      flash[:notice] = "Successfully updated book!"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Error updating book!"
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:notice] = "Successfully deleted book!"
      redirect_to root_path
    else
      flash[:alert] = "Error updating book!"
    end
  end

  def edit
  end

private

  def book_params
    params.require(:book).permit(:title, :description, :cover_url)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
