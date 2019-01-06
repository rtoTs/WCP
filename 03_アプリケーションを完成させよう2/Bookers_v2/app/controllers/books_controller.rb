class BooksController < ApplicationController

  #ユーザーがログインしているか確認
  before_action :authenticate_user!, except: [:about, :start]

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
    @book = Book.new(book_params)
    begin
      @book.save!
      redirect_to book_path(@book), flash: { notice: "Book was successfully created." }
    rescue
      redirect_to books_path, flash: { error: @book.errors.full_messages }
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
    if @book.user_id.to_i != @user.id
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path, flash: { notice: "Book was successfully destroyed." }
    else
      flash.now[:error] = "Error: Book was not destroyed."
      render :show
    end
  end

  def update
    @book = Book.find(params[:id])
    begin
      @book.update!(book_params)
      redirect_to book_path(@book), flash: { notice: "Book was successfully updated." }
    rescue
      redirect_to edit_book_path(@book), flash: { error: @book.errors.full_messages }
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
