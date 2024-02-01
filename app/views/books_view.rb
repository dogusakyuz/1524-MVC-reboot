class BooksView
  def display(books)
    books.each do |book|
      status = book.rent ? "No" : "Yes"
      puts "ID: #{book.id} TITLE: #{book.title} AUTHOR: #{book.author} PRICE: #{book.price} CATEGORY: #{book.category}"
      puts "In the shop: #{status}"
    end
  end

  def ask_for(thing)
    puts "What is #{thing}?"
    gets.chomp
  end
end
