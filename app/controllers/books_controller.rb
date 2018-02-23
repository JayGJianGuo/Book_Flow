class BooksController < ApplicationController

  def index
    @books = Book.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @book = Book.find(params[:id])
  end

end
