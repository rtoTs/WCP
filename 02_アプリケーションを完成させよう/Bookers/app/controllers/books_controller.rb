class BooksController < ApplicationController
  def start
  end

  def show
     @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book), flash: { notice: "Book was successfully created" }
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book), flash: { notice: "Book was successfully updated" }
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
