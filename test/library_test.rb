require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def test_it_exists
    dpl = Library.new("Denver Public Library")

    assert_instance_of Library, dpl
  end

  def test_it_has_attributes
    dpl = Library.new("Denver Public Library")

    assert_equal "Denver Public Library", dpl.name
  end

  def test_it_can_add_author
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal [], dpl.authors
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], dpl.authors
  end

  def test_it_can_return_book_objects
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal [], dpl.books
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expected = [jane_eyre, professor, villette, mockingbird]
    assert_equal expected, dpl.books
  end

  def test_it_can_return_publication_timeframe
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal ({:start=>"1847", :end=>"1857"}), dpl.publication_time_frame(charlotte_bronte)
    assert_equal ({:start=>"1960", :end=>"1960"}), dpl.publication_time_frame(harper_lee)
  end

# Working on this, struggling with getting a book to be able to be checked in and out
  def test_it_can_checkout_book
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal false, dpl.checkout(mockingbird)
    assert_equal false, dpl.checkout(jane_eyre)
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal true, dpl.checkout(jane_eyre)
  end

  # def test_it_can_return_checked_out_books
  #   dpl = Library.new("Denver Public Library")
  #   charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  #   jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  #   villette = charlotte_bronte.write("Villette", "1853")
  #   harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  #   mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  #   dpl.add_author(charlotte_bronte)
  #   dpl.add_author(harper_lee)
  #   dpl.checkout(jane_eyre)
  #
  #   assert_equal [jane_eyre], dpl.checked_out_books
  # end

end
