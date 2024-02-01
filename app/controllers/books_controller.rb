require_relative '../views/books_view'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def list
    # Fetch All the books from Active Record
    books = Book.all
    # Display all books in View
    @view.display(books)
  end

  def add
    # Ask for title => View
    title = @view.ask_for("title")
    # Ask for price
    price = @view.ask_for("price").to_i
    # Ask for author
    author = @view.ask_for("author")
    # Ask for category
    category =@view.ask_for("category")
    # Active Record
    # Create a new book
    book = Book.new(title: title, price: price, author: author, category: category )
    # Save a new book
    book.save
  end

  def edit
    # Fetch ALL the books from Active Record
    books = Book.all
    # Display all books
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_for("ID").to_i
    # Find the book
    book = Book.find(id)
    # Ask for title => View
    new_title = @view.ask_for("title")
    # Ask for price
    new_price = @view.ask_for("price").to_i
    # Ask for author
    new_author = @view.ask_for("author")
    # Ask for category
    new_category = @view.ask_for("category")
    # Edit the data
    book.title = new_title
    book.price = new_price
    book.author = new_author
    book.category = new_category
    # Save the new with new data
    book.save
  end

  def delete
    # Fetch ALL the books from Active Record
    books = Book.all
    # Display all books
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_for("ID").to_i
    # Find the book
    book = Book.find(id)
    # Destroy the book
    book.destroy
  end

  def mark_as_rent
    # Fetch ALL the books from Active Record
    books = Book.all
    # Display all books
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_for("ID").to_i
    # Find the book
    book = Book.find(id)
    # Mark as rent
    if book.rent
      book.rent = false
    else
      book.rent = true
    end
    # Save
    book.save
  end
end
