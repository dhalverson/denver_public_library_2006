class Book

  def initialize(args)
    @author_first_name = args[:author_first_name]
    @author_last_name = args[:author_last_name]
    @title = args[:title]
    @publication_date = args[:publication_date]
  end

end
