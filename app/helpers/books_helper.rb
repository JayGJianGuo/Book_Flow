module BooksHelper

  def render_book_author(book)
    if book.author.nil?
      book.author = "未填写"
    else
      book.author
    end
  end

  def render_book_publisher(book)
    if book.publisher.nil?
      book.publisher = "未填写"
    else
      book.publisher
    end
  end

  def render_book_price(book)
    if book.price.nil?
      book.price = "0.00"
    else
      book.price
    end
  end

end
