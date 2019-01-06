class BooksController < ApplicationController

  def about
  end

  def start
  end

  def show
    @book_info = Book.find_by(id: params[:id])
    @user  = User.find_by(id: @book_info.user_id)
    @book  = Book.new

  end

  def index
    @user  = current_user
    @books = Book.all
    @book  = Book.new
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
    redirect_to book_path(book)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
