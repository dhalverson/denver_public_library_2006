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

end
