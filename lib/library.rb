class Library

  attr_reader :name,
              :authors,
              :books
  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame(author)
    result = {}
    starting = author.books.min_by { |book| book.publication_year }.publication_year
    ending = author.books.max_by { |book| book.publication_year }.publication_year
      result[:start] = starting
      result[:end] = ending
    result
  end

  def checkout(book)
    @books.include?(book)
  end
end
