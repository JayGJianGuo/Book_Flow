module Account::BooksHelper
  def render_book_status(book)
    if book.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
