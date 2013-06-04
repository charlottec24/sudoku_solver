require 'minitest/autorun'
require '../lib/grid.rb'

class TestGrid < Minitest::Unit::TestCase

	def setup
		@string = Grid.new("005360000704000000032000804080500070360801050000020090900100200100009703050730060")
	end

	def test_input
		assert_equal 81, @string.sudoku_string.size
	end

	def test_row
		assert_equal [0,0,5,3,6,0,0,0,0], @string.row[0]
    assert_equal [7,0,4,0,0,0,0,0,0], @string.row[1]
	end

  def test_column
    assert_equal [0,7,0,0,3,0,9,1,0], @string.column[0]
  end

  def test_subgrid
    assert_equal [0,0,5,0,8,0,9,0,0], @string.subgrid[0]
  end
end



