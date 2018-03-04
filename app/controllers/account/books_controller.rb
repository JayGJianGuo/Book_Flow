class Account::BooksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :find_book_and_check, only: [:edit, :update, :destroy, :publish, :hide]

  def index
    @books = current_user.books.recent
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
      flash[:notice] = "新建成功"
      redirect_to account_books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "完成修改"
      redirect_to account_books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to accounts_books_path
    flash[:alert] = "已删除#{@book.title}"
  end

  def publish
    @book.publish!
    redirect_to :back
    flash[:notice] = "已公开#{@book.title}"
  end

  def hide
    @book.hide!
    redirect_to :back
    flash[:notice] = "已隐藏#{@book.title}"
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
    params.require(:book).permit(:title, :description, :is_hidden, :image, :author, :publisher, :price, :isbn)
  end

end
