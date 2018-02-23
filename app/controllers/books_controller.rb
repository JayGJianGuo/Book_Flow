class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]
  before_action :find_book_and_check, only: [:edit, :update, :destroy]
  def index
    @books = Book.all
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
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def find_book_and_check
    @book = Book.find(params[:id])
    if current_user != @book.user
      flash[:alert] = "You have no permission."
    end
  end

  def book_params
    params.require(:book).permit(:title, :description, :user_id)
  end
end
