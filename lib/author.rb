class Author

  attr_reader :books
  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, date)
    result = Book.new({
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: date
      })
      @books << result
      result
  end
end
