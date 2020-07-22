class Book

  attr_reader :title
  def initialize(args)
    @author_first_name = args[:author_first_name]
    @author_last_name = args[:author_last_name]
    @title = args[:title]
    @publication_date = args[:publication_date]
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end

  def publication_year
    @publication_date.chars.last(4).join
  end

end
