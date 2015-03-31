require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save book without title" do
  	book = Book.new
  	assert_not book.save
	end
	test "title should not be longer than 500" do
  	book = Book.new(
  								:title =>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam leo erat, feugiat sed ante euismod, sollicitudin malesuada sem. Integer sit amet libero congue, tempor risus dignissim, ornare dui. Sed sit amet malesuada orci. Integer eu eros mauris. Donec nec orci et turpis posuere pellentesque ut nec ipsum. Cras suscipit sollicitudin justo, quis commodo arcu volutpat et. Mauris rutrum felis non ante condimentum ultricies. Nulla euismod nulla quis gravida laoreet. Integer elementum odio ut tellus sed"
  								)
		assert book.invalid?
	end
	test "publish date should be today or earlier" do
  	book = Book.new(:title => "My Projects",
  									:published => Date.tomorrow)

  	assert_not book.save
  end
end
