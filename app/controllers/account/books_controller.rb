class Account::BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_book_and_check, only: [:edit, :update, :destroy]

  def index
    @books = current_user.books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      redirect_to account_books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to account_books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to account_books_path
  end

  private

  def find_book_and_check
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to root_path
      flash[:alert] = "You have no permission."
    end
  end

  def book_params
    params.require(:book).permit(:title, :description, :is_hidden)
  end

end
