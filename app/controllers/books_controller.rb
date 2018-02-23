class BooksController < ApplicationController

  def index
    @books = Book.published.recent
  end

  def show
    @book = Book.find(params[:id])
    if @book.is_hidden
      flash[:warning] = "This Book already archieved"
      redirect_to root_path
    end
  end

end
